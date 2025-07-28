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
                this.set_name("RTSDMemberOrder");
                this.set_classname("RTSDOrderRegister");
                this.set_titletext("멤버쉽 주문등록");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,1147,900);
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
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum1\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleId\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"campYn\" type=\"STRING\" size=\"256\"/><Column id=\"cDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"bordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/><Column id=\"crdtStat\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"certStat\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgHq\" type=\"STRING\" size=\"256\"/><Column id=\"orgL1\" type=\"STRING\" size=\"256\"/><Column id=\"orgL2\" type=\"STRING\" size=\"256\"/><Column id=\"orgL3\" type=\"STRING\" size=\"256\"/><Column id=\"orgL4\" type=\"STRING\" size=\"256\"/><Column id=\"insOrg\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"cmsagYn\" type=\"STRING\" size=\"256\"/><Column id=\"conMthd\" type=\"STRING\" size=\"256\"/><Column id=\"pcertYn\" type=\"STRING\" size=\"256\"/><Column id=\"tcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"fcDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDay\" type=\"STRING\" size=\"256\"/><Column id=\"agSeq\" type=\"STRING\" size=\"256\"/><Column id=\"inputDt\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrp\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"payGb\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"sumMonAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"ordNo\"/><Col id=\"ordDay\"/><Col id=\"ordId\"/><Col id=\"chanCd\"/><Col id=\"saleId\"/><Col id=\"periodCd\"/><Col id=\"cntCd\"/><Col id=\"regiCd\"/><Col id=\"campYn\"/><Col id=\"cDcrate\"/><Col id=\"cDcamt\"/><Col id=\"custNo\"/><Col id=\"custTp\"/><Col id=\"safekey\"/><Col id=\"grpYn\"/><Col id=\"grpNo\"/><Col id=\"gDcrate\"/><Col id=\"gDcamt\"/><Col id=\"lDcrate\"/><Col id=\"lDcamt\"/><Col id=\"fDcrate\"/><Col id=\"fDcamt\"/><Col id=\"bordNo\"/><Col id=\"statCd\"/><Col id=\"procDay\"/><Col id=\"cancDay\"/><Col id=\"agencyCd\"/><Col id=\"salesGroup\"/><Col id=\"salesOffice\"/><Col id=\"engNm\"/><Col id=\"agDesc\"/><Col id=\"makerCd\"/><Col id=\"modelCd\"/><Col id=\"contentsCd\"/><Col id=\"frCd\"/><Col id=\"carNo\"/><Col id=\"carOwner\"/><Col id=\"cMileage\"/><Col id=\"reqText\"/><Col id=\"payMthd\"/><Col id=\"payDd\"/><Col id=\"accSeq\"/><Col id=\"crdSeq\"/><Col id=\"accChk\"/><Col id=\"accStat\"/><Col id=\"bkeyChk\"/><Col id=\"batchKey\"/><Col id=\"billYn\"/><Col id=\"crdtStat\"/><Col id=\"certCd\"/><Col id=\"certStat\"/><Col id=\"ordAgent\"/><Col id=\"orgCd\"/><Col id=\"orgHq\"/><Col id=\"orgL1\"/><Col id=\"orgL2\"/><Col id=\"orgL3\"/><Col id=\"orgL4\"/><Col id=\"insOrg\"/><Col id=\"psCd\"/><Col id=\"cmsagYn\"/><Col id=\"conMthd\"/><Col id=\"pcertYn\"/><Col id=\"tcgrpNo\"/><Col id=\"vbeln\"/><Col id=\"regId\"/><Col id=\"regDt\"/><Col id=\"chgId\"/><Col id=\"chgDt\"/><Col id=\"fcDay\"/><Col id=\"agDay\"/><Col id=\"agSeq\"/><Col id=\"inputDt\"/><Col id=\"filePath\"/><Col id=\"fileName\"/><Col id=\"seasonCd\"/><Col id=\"statNm\"/><Col id=\"saleCd\"/><Col id=\"saleNm\"/><Col id=\"prdtGrp\"/><Col id=\"prdtGrpNm\"/><Col id=\"payGb\"/><Col id=\"regiAmt\"/><Col id=\"sumMonAmt\"/><Col id=\"monAmt\"/></Row></Rows>");
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
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">0</Col><Col id=\"cdNm\">0</Col></Row><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">1</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">2</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MatCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_period", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cnt", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"lrCd\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"valYn\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"osId\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"flYn\" type=\"STRING\" size=\"256\"/><Column id=\"frYn\" type=\"STRING\" size=\"256\"/><Column id=\"rlYn\" type=\"STRING\" size=\"256\"/><Column id=\"rrYn\" type=\"STRING\" size=\"256\"/><Column id=\"matDesc\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"ordNo\"/><Col id=\"seq\"/><Col id=\"ordId\"/><Col id=\"periodCd\"/><Col id=\"cntCd\">04</Col><Col id=\"regiCd\"/><Col id=\"frCd\"/><Col id=\"lrCd\"/><Col id=\"matCd\"/><Col id=\"ordQty\"/><Col id=\"regiAmt\"/><Col id=\"rentAmt\"/><Col id=\"rentpAmt\"/><Col id=\"fDcrate\"/><Col id=\"fDcamt\"/><Col id=\"monDcamt\"/><Col id=\"monAmt\"/><Col id=\"planDay\"/><Col id=\"planTm\"/><Col id=\"instDay\"/><Col id=\"instTm\"/><Col id=\"instYn\"/><Col id=\"valYn\"/><Col id=\"equNo\"/><Col id=\"osId\"/><Col id=\"osDay\"/><Col id=\"statCd\"/><Col id=\"flYn\"/><Col id=\"frYn\"/><Col id=\"rlYn\"/><Col id=\"rrYn\"/><Col id=\"matDesc\"/><Col id=\"regId\"/><Col id=\"regDt\"/><Col id=\"chgId\"/><Col id=\"chgDt\"/></Row></Rows>");
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
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"servInfAmt\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servAmtSum\" type=\"STRING\" size=\"256\"/><Column id=\"servAmtSumOrg\" type=\"STRING\" size=\"256\"/><Column id=\"servCntOrg\" type=\"STRING\" size=\"256\"/><Column id=\"servInfYN\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_svrCnt", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">1회</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">2회</Col></Row><Row><Col id=\"cd\">3</Col><Col id=\"cdNm\">3회</Col></Row><Row><Col id=\"cd\">4</Col><Col id=\"cdNm\">4회</Col></Row><Row><Col id=\"cd\">5</Col><Col id=\"cdNm\">5회</Col></Row><Row><Col id=\"cd\">6</Col><Col id=\"cdNm\">6회</Col></Row><Row><Col id=\"cd\">7</Col><Col id=\"cdNm\">7회</Col></Row><Row><Col id=\"cd\">8</Col><Col id=\"cdNm\">8회</Col></Row><Row><Col id=\"cd\">9</Col><Col id=\"cdNm\">9회</Col></Row><Row><Col id=\"cd\">999</Col><Col id=\"cdNm\">무제한</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static02", "absolute", "360", "0", "262", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "-82.48%", "213", null, "150", "149.87%", null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1122", "0", "25", "900", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_preminum", "absolute", "-2", "1394", "529", "170", null, null, this);
            obj.set_taborder("2");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_svrCd", "absolute", "590", "345", null, "147", "3.05%", null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_rtsd0013");
            obj.set_autoupdatetype("comboselect");
            obj.set_cellsizingtype("col");
            obj.set_cellclickbound("cell");
            obj.set_scrollbars("autoboth");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"191\"/><Column size=\"85\"/><Column size=\"92\"/><Column size=\"131\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"상세서비스\"/><Cell col=\"1\" text=\"기간\"/><Cell col=\"2\" text=\"타이어본수\"/><Cell col=\"3\" text=\"서비스횟수\"/></Band><Band id=\"body\"><Cell text=\"bind:prsNm\"/><Cell col=\"1\" text=\"bind:periodNm\"/><Cell col=\"2\" text=\"bind:cntNm\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"none\" text=\"bind:servCnt\" combodataset=\"ds_svrCnt\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Edit("p_cntCd", "absolute", "19.62%", "407", null, "21", "77.16%", null, this);
            obj.set_taborder("4");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("p_periodCd", "absolute", "15.43%", "407", null, "21", "81.34%", null, this);
            obj.set_taborder("5");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("p_matCd", "absolute", "11.25%", "407", null, "21", "85.53%", null, this);
            obj.set_taborder("6");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "408", "111", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("제품정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_product", "absolute", "0", "433", null, "87", "65.13%", null, this);
            obj.set_taborder("14");
            obj.set_binddataset("ds_productInfo");
            obj.set_autoupdatetype("itemselect");
            obj.set_enable("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"133\"/><Column size=\"0\"/><Column size=\"155\"/><Column size=\"0\"/><Column size=\"105\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"matCd\"/><Cell col=\"1\" text=\"상품명\"/><Cell col=\"2\" text=\"periodCd\"/><Cell col=\"3\" text=\"렌탈기간\"/><Cell col=\"4\" text=\"cntCd\"/><Cell col=\"5\" text=\"본수\"/></Band><Band id=\"body\"><Cell text=\"bind:matCd\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:matCd\" combodataset=\"ds_MatCd\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"2\" text=\"bind:periodCd\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:periodCd\" combodataset=\"ds_period\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" text=\"bind:cntCd\"/><Cell col=\"5\" displaytype=\"combo\" edittype=\"none\" text=\"bind:cntCd\" combodataset=\"ds_cnt\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplayrowcount=\"-1\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "590", "321", "111", "21", null, null, this);
            obj.set_taborder("15");
            obj.set_text("프리미엄서비스");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new CheckBox("ch_resultArsCall", "absolute", "0", "32", "125", "16", null, null, this);
            obj.set_taborder("17");
            obj.set_text("출금이체동의여부");
            obj.set_value("0");
            obj.set_truevalue("1");
            obj.set_falsevalue("0");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new CheckBox("ch_resultPayInfo", "absolute", "128", "32", "125", "16", null, null, this);
            obj.set_taborder("18");
            obj.set_text("카드인증성공여부");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Radio("ra_sale", "absolute", "99", "48", "233", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("23");
            obj.set_innerdataset("@ds_sale");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_visible("false");

            obj = new Edit("ed_grpNo", "absolute", "255", "32", "97", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_displaynulltext("고객결합번호");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_grpYn", "absolute", "355", "32", "90", "20", null, null, this);
            obj.set_taborder("25");
            obj.set_displaynulltext("고객결합여부");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_payInfo", "absolute", "700", "40", "422", "160", null, null, this);
            obj.set_taborder("26");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Div("div_card", "absolute", "0%", "60", "422", "98", null, null, this.div_payInfo);
            obj.set_taborder("13");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "422", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_custNm", "absolute", "0", "0", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("22");
            obj.set_text("카드주명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Edit("ed_C_custNm", "absolute", "84", "5", "122", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("23");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_ebirDay", "absolute", "210", "0", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("24");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new MaskEdit("ed_C_ebirDay", "absolute", "295", "5", "122", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("25");
            obj.set_type("string");
            obj.set_mask("######");
            obj.set_enable("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_buslNo", "absolute", "210", "0", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("26");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new MaskEdit("ed_C_buslNo", "absolute", "294", "5", "123", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("27");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "30", "422", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_bankCd", "absolute", "0", "30", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("29");
            obj.set_text("카드사");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Combo("cb_C_bankCd", "absolute", "84", "35", "122", "21", null, null, this.div_payInfo.div_card);
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj.set_taborder("30");
            obj.set_innerdataset("@ds_C_bank");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_C_acctNo", "absolute", "210", "30", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("31");
            obj.set_text("카드번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Edit("ed_C_cardNo", "absolute", "294", "35", "123", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("32");
            obj.set_inputtype("number");
            obj.set_maxlength("16");
            obj.set_enable("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "60", "422", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_expireYM", "absolute", "0", "60", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("34");
            obj.set_text("유효년월");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new MaskEdit("ed_C_expireY", "absolute", "140", "65", "40", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("35");
            obj.set_type("string");
            obj.set_mask("####");
            obj.set_enable("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_y", "absolute", "186", "65", "20", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("36");
            obj.set_text("년");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new MaskEdit("ed_C_expireM", "absolute", "84", "65", "25", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("37");
            obj.set_type("string");
            obj.set_mask("##");
            obj.set_enable("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_m", "absolute", "116", "65", "20", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("38");
            obj.set_text("월");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_bankPayDay", "absolute", "210", "60", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("39");
            obj.set_text("결제일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Combo("cb_C_bankPayDay", "absolute", "294", "65", "60", "21", null, null, this.div_payInfo.div_card);
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_C_bankPayDay");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Button("btn_cardConfirm", "absolute", "359", "65", "58", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("41");
            obj.set_text("카드인증");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "30", "422", "31", null, null, this.div_payInfo);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("st_payMthd", "absolute", "0", "30", "80", "31", null, null, this.div_payInfo);
            obj.set_taborder("15");
            obj.set_text("결제방법");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Combo("cb_payMthd", "absolute", "84", "35", "80", "21", null, null, this.div_payInfo);
            this.div_payInfo.addChild(obj.name, obj);
            obj.set_taborder("16");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_payMthd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_payCustTp", "absolute", "236", "30", "54", "31", null, null, this.div_payInfo);
            obj.set_taborder("17");
            obj.set_text("구분");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Combo("cb_payCustTp", "absolute", "294", "35", "123", "21", null, null, this.div_payInfo);
            this.div_payInfo.addChild(obj.name, obj);
            obj.set_taborder("18");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_payCustTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Button("btn_payChoice", "absolute", "169", "35", "62", "21", null, null, this.div_payInfo);
            obj.set_taborder("19");
            obj.set_text("불러오기");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "720", "-170", "425", "31", null, null, this.div_payInfo);
            obj.set_taborder("20");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "5", "80", "21", null, null, this.div_payInfo);
            obj.set_taborder("21");
            obj.set_text("결제정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new CheckBox("ed_ebirDayCheck", "absolute", "84", "5", "120", "16", null, null, this.div_payInfo);
            obj.set_taborder("22");
            obj.set_text("생년월일체크");
            obj.set_value("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new CheckBox("ed_buslNoCheck", "absolute", "204", "5", "120", "16", null, null, this.div_payInfo);
            obj.set_taborder("23");
            obj.set_text("사업자번호체크");
            obj.set_value("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Button("btn_custNew", "absolute", "372", "5", "50", "21", null, null, this.div_payInfo);
            obj.set_taborder("24");
            obj.set_text("신규");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Div("div_acc", "absolute", "0%", "60", "422", "96", null, null, this.div_payInfo);
            obj.set_taborder("25");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "0", "422", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("18");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", "422", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("19");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_bankCd", "absolute", "0", "30", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("20");
            obj.set_text("은행");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Combo("cb_B_bankCd", "absolute", "85", "35", "120", "21", null, null, this.div_payInfo.div_acc);
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj.set_taborder("21");
            obj.set_innerdataset("@ds_B_bank");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_B_acctNo", "absolute", "210", "30", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("22");
            obj.set_text("계좌번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Edit("ed_B_acctNo", "absolute", "295", "35", "120", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("23");
            obj.set_inputtype("number");
            obj.set_maxlength("20");
            obj.set_enable("false");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "60", "422", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("24");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_bankPayDay", "absolute", "0", "60", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("25");
            obj.set_text("결제일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Combo("cb_B_bankPayDay", "absolute", "85", "65", "60", "21", null, null, this.div_payInfo.div_acc);
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj.set_taborder("26");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_B_bankPayDay");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Button("btn_accConfirm", "absolute", "151", "65", "50", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("27");
            obj.set_text("계좌인증");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_custNm", "absolute", "0", "0", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("28");
            obj.set_text("예금주명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Edit("ed_B_custNm", "absolute", "85", "5", "120", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("29");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_buslNo", "absolute", "210", "0", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("30");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new MaskEdit("ed_B_buslNo", "absolute", "295", "5", "120", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("31");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new MaskEdit("ed_B_ebirDay", "absolute", "295", "5", "120", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("32");
            obj.set_type("string");
            obj.set_mask("######");
            obj.set_enable("false");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_ebirDay", "absolute", "210", "0", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("33");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_arsCall", "absolute", "210", "60", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("34");
            obj.set_text("이체동의");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Button("btn_arsCall", "absolute", "295", "65", "80", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("35");
            obj.set_text("출금이체동의");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.div_acc.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "-668", "425", "31", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_model", "absolute", "0", "1392", "679", "62", null, null, this);
            obj.set_taborder("28");
            obj.set_binddataset("ds_model");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("지우면절대안됨");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"167\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"rn\"/><Cell col=\"1\" text=\"makerCd\"/><Cell col=\"2\" text=\"modelCd\"/><Cell col=\"3\" text=\"modelNm\"/><Cell col=\"4\" text=\"contentsCd\"/><Cell col=\"5\" text=\"conTentsNm\"/><Cell col=\"6\" text=\"frCd\"/><Cell col=\"7\" text=\"mcNm\"/></Band><Band id=\"body\"><Cell text=\"bind:rn\"/><Cell col=\"1\" text=\"bind:makerCd\"/><Cell col=\"2\" text=\"bind:modelCd\"/><Cell col=\"3\" text=\"bind:modelNm\"/><Cell col=\"4\" text=\"bind:contentsCd\"/><Cell col=\"5\" text=\"bind:conTentsNm\"/><Cell col=\"6\" text=\"bind:frCd\"/><Cell col=\"7\" text=\"bind:mcNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_custInfo", "absolute", "0", "40", "681", "273", null, null, this);
            obj.set_taborder("30");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "-1", "30", "682", "31", null, null, this.div_custInfo);
            obj.set_taborder("198");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_buslNo", "absolute", "337", "35", "115", "21", null, null, this.div_custInfo);
            obj.set_taborder("199");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_buslNo", "absolute", "232", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("200");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_custTp", "absolute", "0", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("201");
            obj.set_text("고객유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Combo("cb_custTp", "absolute", "104", "35", "124", "21", null, null, this.div_custInfo);
            this.div_custInfo.addChild(obj.name, obj);
            obj.set_taborder("202");
            obj.set_innerdataset("@ds_custTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_birthDay", "absolute", "232", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("203");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_birthDay", "absolute", "336", "35", "116", "21", null, null, this.div_custInfo);
            obj.set_taborder("204");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "456", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("205");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "560", "35", "115", "21", null, null, this.div_custInfo);
            obj.set_taborder("206");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "404", "5", "100", "20", null, null, this.div_custInfo);
            obj.set_taborder("207");
            obj.set_text("고객번호");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "456", "5", "110", "21", null, null, this.div_custInfo);
            obj.set_taborder("208");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "60", "682", "31", null, null, this.div_custInfo);
            obj.set_taborder("209");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_genderCd", "absolute", "0", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("210");
            obj.set_text("성별");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_repNm", "absolute", "104", "65", "347", "21", null, null, this.div_custInfo);
            obj.set_taborder("211");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Combo("cb_genderCd", "absolute", "104", "65", "124", "21", null, null, this.div_custInfo);
            this.div_custInfo.addChild(obj.name, obj);
            obj.set_taborder("212");
            obj.set_innerdataset("@ds_genderCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_repNm", "absolute", "0", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("213");
            obj.set_text("대표자명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_lfCd", "absolute", "232", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("214");
            obj.set_text("내/외국인");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Combo("cb_lfCd", "absolute", "336", "65", "116", "21", null, null, this.div_custInfo);
            this.div_custInfo.addChild(obj.name, obj);
            obj.set_taborder("215");
            obj.set_innerdataset("@ds_lfCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_telNo", "absolute", "456", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("216");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "560", "65", "115", "21", null, null, this.div_custInfo);
            obj.set_taborder("217");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Button("btn_custNew", "absolute", "570", "5", "41", "21", null, null, this.div_custInfo);
            obj.set_taborder("218");
            obj.set_text("신규");
            obj.getSetter("domainId").set("nexa.save");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Button("btn_custNoSearch", "absolute", "615", "5", "65", "21", null, null, this.div_custInfo);
            obj.set_taborder("219");
            obj.set_text("고객조회");
            obj.getSetter("domainId").set("nexa.save");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "5", "80", "21", null, null, this.div_custInfo);
            obj.set_taborder("220");
            obj.set_text("고객정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "-1", "90", "682", "31", null, null, this.div_custInfo);
            obj.set_taborder("221");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_busiType", "absolute", "104", "95", "124", "21", null, null, this.div_custInfo);
            obj.set_taborder("222");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_busiType", "absolute", "0", "90", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("223");
            obj.set_text("업종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_busiCond", "absolute", "232", "90", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("224");
            obj.set_text("업태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_busiCond", "absolute", "336", "95", "338", "21", null, null, this.div_custInfo);
            obj.set_taborder("225");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Div("div_custInfoDetail", "absolute", "0", "120", "681", "152", null, null, this.div_custInfo);
            obj.set_taborder("226");
            obj.style.set_background("@gradation");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "120", "681", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("90");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "-1", "0", "682", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("91");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_emailAddr1", "absolute", "560", "5", "116", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("92");
            obj.set_inputtype("number,english,symbol");
            obj.set_maxlength("35");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_emailAddr", "absolute", "456", "0", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("93");
            obj.set_text("e-mail주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Combo("cb_mobFirm", "absolute", "336", "5", "116", "21", null, null, this.div_custInfo.div_custInfoDetail);
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj.set_taborder("94");
            obj.set_innerdataset("@ds_mobFirm");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_mobFirm", "absolute", "232", "0", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("95");
            obj.set_text("통신사");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new MaskEdit("ed_mobNo", "absolute", "104", "5", "124", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("96");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "0", "0", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("97");
            obj.set_text("휴대폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "-1", "30", "682", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("98");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_addr1", "absolute", "336", "35", "340", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("99");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_addr1", "absolute", "232", "30", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("100");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_posCd", "absolute", "104", "35", "124", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("101");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_posCd", "absolute", "0", "30", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("102");
            obj.set_text("고객주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "60", "682", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("103");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_addr2", "absolute", "232", "60", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("104");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_addr12", "absolute", "336", "65", "340", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("105");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_posCd2", "absolute", "104", "65", "124", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("106");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_posCd2", "absolute", "0", "60", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("107");
            obj.set_text("근무지주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "90", "681", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("108");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_nagYn", "absolute", "232", "90", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("109");
            obj.set_text("정보제공동의");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_telNo2", "absolute", "456", "90", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("110");
            obj.set_text("회사전화");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_telNo2", "absolute", "560", "95", "116", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("111");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_credit", "absolute", "232", "120", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("112");
            obj.set_text("신용조회");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Button("btn_creditSelect", "absolute", "464", "125", "65", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("113");
            obj.set_text("신용조회");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.save");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Combo("cb_nagYn", "absolute", "335", "95", "116", "21", null, null, this.div_custInfo.div_custInfoDetail);
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj.set_taborder("114");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_nagYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Combo("cb_credit", "absolute", "337", "125", "123", "21", null, null, this.div_custInfo.div_custInfoDetail);
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj.set_taborder("115");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_credit");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_certification", "absolute", "0", "90", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("116");
            obj.set_text("본인인증");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Radio("ra_certification", "absolute", "104", "95", "124", "20", null, null, this.div_custInfo.div_custInfoDetail);
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj.set_taborder("117");
            obj.set_innerdataset("@ds_certification");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj = new Static("st_certi", "absolute", "0", "120", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("118");
            obj.set_text("휴대폰 인증");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Button("btn_certification", "absolute", "104", "125", "41", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("119");
            obj.set_text("인증");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.save");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new WebBrowser("nice_interface", "absolute", "151", "124", "124", "24", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("120");
            obj.set_visible("false");
            obj.set_url("https://portal.tirerental.co.kr/interface/di_safekey/main.jsp");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_cCustnm", "absolute", "0", "210", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("227");
            obj.set_text("담당자명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_Ccustnm", "absolute", "104", "215", "124", "21", null, null, this.div_custInfo);
            obj.set_taborder("228");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_cTelno", "absolute", "232", "210", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("229");
            obj.set_text("담당자        전화번호");
            obj.set_wordwrap("char");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.style.set_align("left middle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_cTelno", "absolute", "336", "215", "115", "21", null, null, this.div_custInfo);
            obj.set_taborder("230");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_custInfo.addChild(obj.name, obj);

            obj = new Div("div_carInfo", "absolute", "700", "190", "422", "140", null, null, this);
            obj.set_taborder("31");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "30", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("63");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_model", "absolute", "0", "30", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("64");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Combo("cb_makerCd", "absolute", "104", "35", "107", "21", null, null, this.div_carInfo);
            this.div_carInfo.addChild(obj.name, obj);
            obj.set_taborder("65");
            obj.set_displaynulltext("브랜드");
            obj.set_innerdataset("@ds_maker");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Combo("cb_model", "absolute", "215", "35", "202", "21", null, null, this.div_carInfo);
            this.div_carInfo.addChild(obj.name, obj);
            obj.set_taborder("66");
            obj.set_displaynulltext("모델");
            obj.set_innerdataset("@ds_model");
            obj.set_codecolumn("rn");
            obj.set_datacolumn("mcNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static00", "absolute", "0", "60", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("67");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_carOwner", "absolute", "0", "60", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("68");
            obj.set_text("차량소유자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_carOwner", "absolute", "104", "65", "107", "21", null, null, this.div_carInfo);
            obj.set_taborder("69");
            obj.set_maxlength("60");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "299", "65", "118", "21", null, null, this.div_carInfo);
            obj.set_taborder("70");
            obj.set_maxlength("9");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "215", "60", "80", "31", null, null, this.div_carInfo);
            obj.set_taborder("71");
            obj.set_text("차량No");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "90", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("72");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_cMileage", "absolute", "0", "90", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("73");
            obj.set_text("현재주행거리");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_cMileage", "absolute", "104", "95", "107", "21", null, null, this.div_carInfo);
            obj.set_taborder("74");
            obj.set_mask("###,###,###,##0");
            obj.set_autoselect("true");
            obj.set_autoskip("true");
            obj.set_limitbymask("both");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_model", "absolute", "103", "5", "120", "21", null, null, this.div_carInfo);
            obj.set_taborder("75");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "5", "80", "21", null, null, this.div_carInfo);
            obj.set_taborder("76");
            obj.set_text("차량정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_cMileage2", "absolute", "218", "98", "25", "20", null, null, this.div_carInfo);
            obj.set_taborder("77");
            obj.set_text("Km");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_model01", "absolute", "287", "5", "37", "21", null, null, this.div_carInfo);
            obj.set_taborder("78");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_model00", "absolute", "247", "5", "37", "21", null, null, this.div_carInfo);
            obj.set_taborder("79");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "321", "89", "21", null, null, this);
            obj.set_taborder("32");
            obj.set_text("판매정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "345", "440", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("Static05");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_SalePrdtNm", "absolute", "120", "345", "87", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_text("판매상품명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_BtnSalePrdt", "absolute", "0", "345", "121", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_SaleCd", "absolute", "71.93%", "319", null, "21", "15.61%", null, this);
            obj.set_taborder("36");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_SalePrdtSearch", "absolute", "15", "350", "89", "21", null, null, this);
            obj.set_taborder("37");
            obj.set_text("판매상품조회");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_SaleProdNm", "absolute", "213", "351", "220", "20", null, null, this);
            obj.set_taborder("38");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "0", "0", "352", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "0", "0", "100", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_orderNo", "absolute", "104", "5", "150", "20", null, null, this);
            obj.set_taborder("41");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNoSearch", "absolute", "258", "5", "89", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_text("계약번호찾기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Div("div_sumInfo", "absolute", "590", "504", null, "60", "35", null, this);
            obj.set_taborder("43");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Div("Div00", "absolute", "-82.79%", "253", null, "150", "149.85%", null, this.div_sumInfo);
            obj.set_taborder("30");
            obj.set_text("Div00");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "22", "234", "31", null, null, this.div_sumInfo);
            obj.set_taborder("31");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "0", "22", "85", "31", null, null, this.div_sumInfo);
            obj.set_taborder("32");
            obj.set_text("월납입금");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "-4", "120", "21", null, null, this.div_sumInfo);
            obj.set_taborder("33");
            obj.set_text("결제정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Edit("ed_totalPrice", "absolute", "90", "27", "138", "21", null, null, this.div_sumInfo);
            obj.set_taborder("34");
            obj.set_inputtype("number");
            obj.set_displaynulltext("0");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.style.setStyleValue("align", "disabled", "right middle");
            this.div_sumInfo.addChild(obj.name, obj);

            obj = new Button("btnOrderAdd", "absolute", null, "530", "84", "22", "215", null, this);
            obj.set_taborder("44");
            obj.set_text("주문서 저장");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_borderNo", "absolute", "464", "5", "150", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_bordNo", "absolute", "360", "0", "100", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("이전계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 422, 98, this.div_payInfo.div_card,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("13");
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
            		p.set_taborder("25");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");

            	}
            );
            this.div_payInfo.div_acc.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 422, 160, this.div_payInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("26");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enable("false");

            	}
            );
            this.div_payInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 681, 152, this.div_custInfo.div_custInfoDetail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("226");
            		p.style.set_background("@gradation");

            	}
            );
            this.div_custInfo.div_custInfoDetail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 681, 273, this.div_custInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("30");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");

            	}
            );
            this.div_custInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 422, 140, this.div_carInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("31");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enable("false");

            	}
            );
            this.div_carInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 60, this.div_sumInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("43");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");

            	}
            );
            this.div_sumInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 900, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDOrderRegister");
            		p.set_titletext("멤버쉽 주문등록");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
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
            obj = new BindItem("item12","div_carInfo.ed_model","value","ds_rtsd0104","modelCd");
            this.addChild(obj.name, obj);
            obj.bind();
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
            obj = new BindItem("item33","div_custInfo.ed_busiType","value","ds_rtsd0100","busiType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item34","div_custInfo.ed_busiCond","value","ds_rtsd0100","busiCond");
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
            obj = new BindItem("item19","div_custInfo.div_custInfoDetail.cb_credit","value","ds_rtsd0104","crdtStat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item41","div_custInfo.div_custInfoDetail.ra_certification","value","ds_rtsd0104","certCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item51","div_custInfo.ed_Ccustnm","value","ds_rtsd0100","cCustnm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item52","div_custInfo.ed_cTelno","value","ds_rtsd0100","cTelno");
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
            obj = new BindItem("item6","div_payInfo.div_acc.ed_B_custNm","value","ds_rtre0010","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_payInfo.div_acc.ed_B_buslNo","value","ds_rtre0010","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_payInfo.div_acc.ed_B_ebirDay","value","ds_rtre0010","ebirDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item47","ed_grpYn","value","ds_rtsd0104","grpYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item44","ed_grpNo","value","ds_rtsd0104","grpNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ra_sale","value","ds_rtsd0104","saleId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","p_matCd","value","ds_productInfo","matCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","p_periodCd","value","ds_productInfo","periodCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","p_cntCd","value","ds_productInfo","cntCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","ed_orderNo","value","ds_rtsd0104","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_carInfo.ed_model01","value","ds_rtsd0104","frCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item43","div_carInfo.ed_model00","value","ds_rtsd0104","contentsCd");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDMemberOrder.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDMemberOrder.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDMemberOrder.xfdl
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
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 			= "RTSDMemberOrder";
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
        this.Sumpay			= "";
        this.userGrp 		=  "02";//application.gds_userInfo.getColumn(0, "userGrp");	//사용자 그룹 		--> *01:영업관리자, *02:콜센터, *03:지사, *04:지점, *05:대리점, *13:콜센터(아웃바운드)
        this.onlineLoginId	= "ONL_SYS";
        this.certificationFlag	= false;

        this.reRental       = false; //[김선태]재렌탈 추가

        this.addPrdtAmt		= "";
        this.payStatCd      = "00";
        this.getcheckOrdNo  = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //공통 fn_callBack START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if (strSvcId == "initRTSDMemberOrder"){
        		this.fn_getToday();
        		this.FN_cust01();
        		
        		var insert1 = this.ds_B_bankPayDay.insertRow( 0 );
        		this.ds_B_bankPayDay.setColumn(insert1,"cd","-1");
        		this.ds_B_bankPayDay.setColumn(insert1,"cdNm","선택");
        		
        		var insert2 = this.ds_C_bankPayDay.insertRow( 0 );
        		this.ds_C_bankPayDay.setColumn(insert2,"cd","-1");
        		this.ds_C_bankPayDay.setColumn(insert2,"cdNm","선택");
        		
        		var sSvcID      	= "MemberOrderCombo";  
        		var sController   	= "/rtms/sd/MemberOrderCombo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sOutDatasets += " ds_MatCd=mapMatCd ";
        		sOutDatasets += " ds_period=mapPeriod ";
        		sOutDatasets += " ds_cnt=mapCnt ";

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	if(strSvcId == "MemberOrderCombo"){
        		this.ds_period.filter("cd <='24'");
        	}
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        	if(strSvcId == "sRtsd0113UserGrp"){
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
        						return this.go("sd::RTSDMemberOrder.xfdl");
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
        		trace("aaa");
        		if(nvl(this.ds_rtsd0104.getColumn(0,"ordNo").substring(0,1)) == 'L') {
        			alert("일시불 주문등록은 일시불 주문등록 메뉴를 이용해 주시기 바랍니다.");
        			this.FN_initializationDataSet();
        			return;
        		}

        		var rtsd0104Cnt = this.ds_rtsd0104.getRowCount();
        		if( rtsd0104Cnt != 0 ){
        		
        			
        			this.p_makerCd 		= nvl(this.ds_rtsd0104.getColumn(0,"makerCd"));
        			this.p_modelCd 		= nvl(this.ds_rtsd0104.getColumn(0,"modelCd"));
        			this.p_contentsCd 	= nvl(this.ds_rtsd0104.getColumn(0,"contentsCd"));
        			this.p_frCd 		= nvl(this.ds_rtsd0104.getColumn(0,"frCd"));
        			
        			this.div_carInfo_cb_makerCd_onitemchanged();

        			var payMthd = nvl(this.ds_rtsd0104.getColumn(0,"payMthd"));
        			var payDd 	= nvl(this.ds_rtsd0104.getColumn(0,"payDd"));
        			if( payMthd == "A" ){
        				this.div_payInfo.div_acc.cb_B_bankPayDay.set_value(payDd);
        			}else if( payMthd == "C" ){
        				this.div_payInfo.div_card.cb_C_bankPayDay.set_value(payDd);
        			}else{
        			}
        			//this.FN_listRtsd0106();
        			if(this.ed_orderNo.value != ""){
        				if(this.ds_rtsd0104.getColumn(0,"ordId")==04){
        					this.ed_SaleCd.set_value(this.ds_rtsd0104.getColumn(0,"saleCd"));
        					this.ed_SaleProdNm.set_value(this.ds_rtsd0104.getColumn(0,"saleNm"));
        					this.p_periodCd.set_value(this.ds_rtsd0104.getColumn(0,"periodCd"));
        					this.fn_searchProduct(); 	// 계약별 제품정보 불러오기				
        					this.fn_searchPrmmSrvc(); 	// 계약별 프리미엄 서비스  불러오기 
        					this.fn_getSumpay();		// 총합계					
        					if(this.ds_rtsd0104.getColumn(0,"statCd")==01){
        						this.btnOrderAdd.set_visible(false);
        					}
        				}
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
        		/*		this.div_etcInfo.ch_pcertYn.set_value(true);*/
        			}else{
        				/*this.div_etcInfo.ch_pcertYn.set_value(false);*/
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
        			//this.FN_payInfo_enable();
        			this.payAddRowFlag = false;
        			this.div_payInfo_cb_payMthd_onitemchanged();
        			this.FN_payInfo_enable();
        		}else{
        		}
        		if( rtre0020Cnt != 0 ){
        			this.ds_rtre0020.set_updatecontrol(false);
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
        			this.ds_rtre0020.setRowType(0, Dataset.ROWTYPE_NORMAL);
        			this.ds_rtre0020.set_updatecontrol(true);
        			this.div_payInfo.cb_payCustTp.set_value( this.ds_rtre0020.getColumn(0,"custTp") );
        			this.ch_resultPayInfo.set_value( this.ds_rtre0020.getColumn(0,"bkeyChk") == "Y" ? true : false);
        			//this.FN_payInfo_enable();
        			this.payAddRowFlag = false;
        			this.div_payInfo_cb_payMthd_onitemchanged();
        			this.FN_payInfo_enable();
        		}else{
        		}
        		
        		if( rtre0010Cnt == 0 && rtre0020Cnt == 0 ){
        			//alert("계약조회 : 결제정보가 없습니다.");
        		}
        		this.FN_divChangeTrue();		
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
        		
        // 		this.btnAddPrdt.set_enable(true);
        // 		this.btnAddPrdtDel.set_enable(true);
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
        				/*this.div_etcInfo.ch_pcertYn.set_value(true);*/
        			}else{
        				/*this.div_etcInfo.ch_pcertYn.set_value(false);*/
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
        	if(strSvcId == "saveMemberOrder"){
        		if(nErrorCode == "-2"){
        			alert(strErrorMsg);
        		}else if( nErrorCode == "0" && this.resultOrdNo != "0" ){
        			this.ed_orderNo.set_value(this.resultOrdNo);
        			if( confirm( strErrorMsg +"\n저장된 계약번호는 \'"+this.resultOrdNo+"\' 입니다." + "\n저장된 계약번호로 조회하시겠습니까?") ){
        				this.FN_listRtsd0104( this.resultOrdNo );
        				this.btnOrderAdd.set_visible(false);
        			}else{
        				this.FN_listRtsd0104( this.resultOrdNo );
        				this.reload();
        			}
        		}else{
        			alert(strErrorMsg);
        		}
        	
        	}
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
        		if(nErrorCode == "-2"){
        			alert(strErrorMsg);
        		}else if( nErrorCode == "0" && this.resultOrdNo != "0" ){
        			if( confirm( strErrorMsg +"\n저장된 계약번호는 \'"+this.resultOrdNo+"\' 입니다." + "\n저장된 계약번호로 조회하시겠습니까?") ){
        				this.accCardCheck   = false;
        				this.ds_sumPayInfo.clearData();				
        				this.FN_listRtsd0104( this.resultOrdNo );
        			}else{
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
        			if(parseInt(userCrGrade) > commCrGrade) {
        				alert('신용결과 계약불가입니다.');
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("N");
        				return;
        			}else{
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("Y");
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
        	this.btn_SalePrdtSearch.set_enable(true);
        		var returnCode = this.dsNice2.getColumn(0, "returnCode");	//성공여부
        		var commCrGrade = this.dsNice2.getColumn(0, "cdLevel");		//체크권한
        		var userCrGrade = this.dsNice2.getColumn(0, "trustLevel");	//사용자권한
        		
        		if( returnCode == "P000" ){
        			if(parseInt(userCrGrade) > commCrGrade) {
        				alert('신용결과 계약불가입니다.');
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("N");
        				return;
        			}else{
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("Y");
        				this.FN_divChangeTrue();
        			}
        		}else{
        			//this.alert(application.gv_host);
        			if(application.gv_host == "http://localhost/" || application.gv_host == "http://1.254.67.135:9080/"){
        				alert("개발용: 신용조회 무시");
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("Y");
        				this.FN_divChangeTrue();			
        			}else{
        				alert("신용조회를 실패하였습니다.");	
        			}
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
        			if(application.gv_host == "http://localhost/" || application.gv_host == "http://1.254.67.135:9080/"){
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
        	if(strSvcId == "Sumpay"){
        		this.contactRowChg();
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
        			if(application.gv_host == "http://localhost/" || application.gv_host == "http://1.254.67.135:9080/"){
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
        			this.alert("출금이체동의에 실패하였습니다.\n["+strErrorMsg+"]");
        			this.ch_resultArsCall.set_value(false);
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
        	
        	if(strSvcId == "getcheckOrdNo"){//bOrdNo
        		if(this.getcheckOrdNo  == ""){
        			alert("이전 계약번호가 존재하지 않습니다.");
        		}else{
        			alert("이전 계약번호는 "+this.getcheckOrdNo +" 입니다.");
        			this.ed_borderNo.set_value(this.getcheckOrdNo);
        		}

        	}
        	
        	//판매상품조회 후 값 가져오기
        	if(strSvcId == "saleItemList") {
        		if(nvl(this.ed_SaleCd.value,"") != "") {
        		this.ed_SaleProdNm.set_value(nvl(this.ds_saleItemList.getColumn(0,"saleNm")));
        		}
        		this.ds_sumPayInfo.addRow();
        		this.contactRowChg();
        	}
        	
        	/*
        	if(strSvcId == "saleRegiAmtInfo") {
        		
        		this.ds_sumPayInfo.addRow();
        		this.ds_sumPayInfo.setColumn(0,"regiAmtChg"," ");
        	}
        	*/
        	//제품별 프리미엄서비스
        	if(strSvcId == "srvcOrdList"){
        	
        		if(nvl(this.ds_rtsd0013.getColumn(0, "servInfYN")) == ""){
        			this.alert("해당타이어 " + this.p_cntCd.value + " 본수에 제공되는 프리미엄 상품은 없습니다.");	
        		}
        		// 무제한 선택여부 
        		if(nvl(this.ds_rtsd0013.getColumn(0, "servInfYN")) != 'Y'){
        			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "displaytype", "normal");
        			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "edittype", "none");
        		}
        // 		else{
        // 			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "displaytype", "combo");
        // 			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "edittype", "combo");
        // 		}
        		this.contactRowChg();
        			
        	}
        	
        	//계약별 제품정보
        	if(strSvcId == "listAddSelProduct2") {
        	
        		if(nvl(this.p_periodCd.value) == ''){

        		this.p_periodCd.set_value(this.ds_productInfo.getColumn(0,"periodCd") ); // 처음 등록일 경우
        	}
        		
        		this.ds_sumPayInfo.addRow();
        		//등록비 관련 데이타 조회(2018.10.30)
        		//this.FN_saleRegiAmt();
        		var sPeriod = 0;
        		if(this.ed_orderNo.value != ''){
        			var regiAmt = nvl(this.ds_rtsd0104.getColumn(0,"regiAmt")) == ""?"0":nvl(this.ds_rtsd0104.getColumn(0,"regiAmt"));
        			var sumMonAmt = nvl(this.ds_rtsd0104.getColumn(0,"sumMonAmt")) == ""?"0":nvl(this.ds_rtsd0104.getColumn(0,"sumMonAmt"));
        			
        			if(nvl(this.p_periodCd.value) == '') {
        				sPeriod = 0;
        			} else {
        				sPeriod = this.p_periodCd.value;
        			}
        			trace("sPeriod:"+sPeriod);
        			
        		}
        	}
        	//계약별 프리미엄서비스
        		if(strSvcId == "prmmSrvcOrdList"){
        		//this.alert(this.ds_rtsd0013.getColumn(0, "servInfYN"));
        		// 무제한 선택여부 
        		if(nvl(this.ds_rtsd0013.getColumn(0, "servInfYN")) != 'Y'){
        			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "displaytype", "normal");
        			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "edittype", "none");
        		}
        // 		else{
        // 			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "displaytype", "combo");
        // 			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "edittype", "combo");
        // 		}
        		this.contactRowChg();
        	
        	}
        	if(strSvcId == "cntPrdPymInfoList"){
        		
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
        this.RTSDMemberOrder_onload = function(obj,e){
        //FORM ONLOAD FUNCTION
        	Ex.core.init(obj);
        	this.fn_init(); 
        	this.parent.setButton("", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //UserFunction : 상품-가격정보 변경 및 SELECT BOX DATA SELECT
        this.fn_init = function(){
        		
        	var sSvcID      	= "initRTSDMemberOrder";  
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
        	sOutDatasets += " ds_sale=maptDsSale ";	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	//부가제품정보 공통추가(2018.10.26)
        	var sSvcID        	= "listCommInfo";                    
        	var sController   	= "/rtms/sd/listAddProductCommInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "comGrp=com_grp";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	
        	//초기로딩시 판매상품관련 버튼 비활성화
        	this.btn_SalePrdtSearch.set_enable(false);
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
        	var args ={p_arg : this.p_arg };
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(ds){
        	
        	this.FN_divChangeFalse();
         	if(ds[0].rowcount > 0){
         		this.FN_initializationDataSet();
         		this.ds_rtsd0100.copyData(ds[0]);
         		
         		var contactRow = this.ds_rtsd0104.addRow();
         		//this.ds_rtsd0106.addRow();
         		//this.ds_price.addRow();
         		this.ds_rtsd0104.setColumn(contactRow,"carOwner",ds[0].getColumn(0, "custNm"));
         		
         		this.div_custInfo_cb_custTp_onitemchanged();//고객유형 CHANCE EVENT
         		
         		this.div_payInfo.cb_payMthd.set_enable(true);
         		this.div_payInfo.btn_payChoice.set_visible(true);
         		
         		this.FN_telNoChange();
         		this.FN_listCustInfo( ds[0].getColumn(0, "custNo") );
         		
         		var regId   = nvl( ds[0].getColumn(0,"regId")  );
         		var custTp  = nvl( ds[0].getColumn(0,"custTp") );
         		if( this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ){//B2B
         			this.FN_divChangeTrue();
         		}
         		this.payAddRowFlag = true;	
         		
         		//재렌탈 대상 확인
         		this.checkOrdNo(ds[0].getColumn(0, "custNo"));
         		
         	}
        }

        this.checkOrdNo = function(custNo){
        	
        	var sSvcID      	= "getcheckOrdNo";  
        	var sController   	= "/rtms/sd/getcheckOrdNo.do";
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
        	/*this.ds_productInfo.clearData();*/
        	//this.ds_price.clearData();
        	//this.ds_rateAmt.clearData();
        	this.ds_rtre0010.clearData();
        	this.ds_rtre0020.clearData();
        	this.ds_rtsd0013.clearData();
        	//this.ds_rtsd0014.clearData();
        	this.dsNice.clearData();
        	this.dsNice2.clearData();
        	
        	this.p_periodCd.set_value("");
        	this.p_matCd.set_value("");
        	this.div_payInfo.div_acc.cb_B_bankPayDay.set_value("-1");
        	this.div_payInfo.div_card.cb_C_bankPayDay.set_value("-1");
        	this.div_carInfo.cb_model.set_index(-1);
        	this.div_payInfo.div_card.ed_C_expireY.set_value("");
        	this.div_payInfo.div_card.ed_C_expireM.set_value("");
        	this.ch_resultArsCall.set_value(false);
        	this.btnOrderAdd.set_visible(true);
        	this.div_sumInfo.ed_totalPrice.set_value(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 전화번호 FN_numberHyphenInReturn
        this.FN_telNoChange = function(){

        	var telNo  = nvl(this.ds_rtsd0100.getColumn(0,"telNo"));
        	var telNo2 = nvl(this.ds_rtsd0100.getColumn(0,"telNo2"));
        	var cTelno = nvl(this.ds_rtsd0100.getColumn(0,"cTelno"));
        	
        /*	if( telNo != "" ){ 	this.div_custInfo.ed_telNo.set_value( FN_numberHyphenInReturn(telNo) ); 						}*/
        	if( telNo2 != "" ){ this.div_custInfo.div_custInfoDetail.ed_telNo2.set_value( FN_numberHyphenInReturn(telNo2) ); 	}
        	if( cTelno != "" ){ this.div_custInfo.ed_cTelno.set_value( FN_numberHyphenInReturn(cTelno) ); 						}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

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
        	//this.div_preminum.set_enable(true);

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
        	this.div_payInfo.set_enable(false);
        	this.div_payInfo.cb_payCustTp.set_enable(false);
        	this.div_carInfo.set_enable(false);
        	this.grid_product.set_enable(false);
        	//this.div_productInfo.set_enable(false);
        	/*this.div_installInfo.set_enable(false);*/
        	//this.div_preminum.set_enable(false);
        	
        	var regId   = nvl( this.ds_rtsd0100.getColumn(0,"regId")  );
        	var custTp  = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );
        	
        	// [20161206_02]
        	if( (this.userGrp == "02") || (this.userGrp == "13") || (this.userGrp == "01" && regId != "ONL_SYS" && custTp == "02") ){
        /*		this.div_salesmanInfo.set_enable(false);*/
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
        	this.div_custInfo.div_custInfoDetail.st_credit.set_visible(true);
        	this.div_custInfo.div_custInfoDetail.cb_credit.set_visible(true);
        	this.div_custInfo.div_custInfoDetail.btn_creditSelect.set_visible(true);
        	this.div_custInfo.div_custInfoDetail.st_nagYn.set_visible(true);
        	this.div_custInfo.div_custInfoDetail.cb_nagYn.set_visible(true);
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
        	this.div_custInfo.div_custInfoDetail.st_credit.set_visible(false);
        	this.div_custInfo.div_custInfoDetail.cb_credit.set_visible(false);
        	this.div_custInfo.div_custInfoDetail.btn_creditSelect.set_visible(false);
        	this.div_custInfo.div_custInfoDetail.st_nagYn.set_visible(false);
        	this.div_custInfo.div_custInfoDetail.cb_nagYn.set_visible(false);
        	this.div_custInfo.st_cCustnm.set_visible(true);
        	this.div_custInfo.ed_Ccustnm.set_visible(true);
        	this.div_custInfo.st_cTelno.set_visible(true);
        	this.div_custInfo.ed_cTelno.set_visible(true);
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //BUTTON EVENT
        this.div_custInfo_div_custInfoDetail_btn_creditSelect_onclick = function(obj,e){
        	var custTp  = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );
        	var safekey = nvl(this.ds_rtsd0100.getColumn(0,"safekey"));
        	var nagYn	= nvl(this.div_custInfo.div_custInfoDetail.cb_nagYn.value);
        	
        	if( custTp == "01" ){//개인
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
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMLumpSum_pop.xfdl",args, "modaless=false");	
        }
        this.returnOrderNoInfo = function(ordNo){
        	//this.FN_divChangeFalse();
        	this.FN_listRtsd0104(ordNo);
        	this.div_custInfo.div_custInfoDetail.btn_creditSelect.set_visible(false);
        // 	
        // 	if( this.userGrp == "05" ){
        // 		this.div_installInfo.btn_searchAgency.set_visible(false);
        // 		this.div_installInfo.ed_agencyNm.set_width(370);
        // 	}else{
        // 		this.div_installInfo.btn_searchAgency.set_visible(true);
        // 		this.div_installInfo.ed_agencyNm.set_width(320);
        // 	}	
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

        	if( chanCd == "02" || chanCd == "03" ){
        		alert("온라인, 방판 정보는 수정 처리가 불가 합니다!");
        		return false;
        	}
        	
        // 	if( statCd=="03" || statCd=="04" || statCd=="06" ){
        // 		alert("장착대기, 장착완료, 계약취소 정보는 수정  처리가 불가 합니다!");
        // 		return false;
        // 	}
        	
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
        		// 2016-06-13 이영근, 신분증으로 본인인증한 경우 CMS 등록하지 못하도록 처리
        		alert("결제방법이 'CMS'인 경우, 휴대폰으로 본인인증한 회원만 신청이 가능합니다.");
        		this.div_custInfo.div_custInfoDetail.ra_certification.set_enable( true);
        		this.div_custInfo.div_custInfoDetail.btn_certification.set_enable(true);
        		this.div_custInfo.div_custInfoDetail.ra_certification.set_value("01");
        		this.div_custInfo.div_custInfoDetail.btn_certification.setFocus(true);
        		return false;		
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
        this.FN_payInfo_enable = function(){
        	this.div_payInfo.cb_payMthd.set_enable(false);
        	this.div_payInfo.cb_payCustTp.set_enable(false);
        	
        	this.div_payInfo.div_card.ed_C_custNm.set_enable(false);
        	this.div_payInfo.div_card.ed_C_ebirDay.set_enable(false);
        	this.div_payInfo.div_card.ed_C_buslNo.set_enable(false);
        	this.div_payInfo.div_card.cb_C_bankCd.set_enable(false);
        	this.div_payInfo.div_card.ed_C_cardNo.set_enable(false);
        	this.div_payInfo.div_card.ed_C_expireY.set_enable(false);
        	this.div_payInfo.div_card.ed_C_expireM.set_enable(false);

        	this.div_payInfo.div_acc.ed_B_custNm.set_enable(false);
        	this.div_payInfo.div_acc.ed_B_ebirDay.set_enable(false); 
        	this.div_payInfo.div_acc.ed_B_buslNo.set_enable(false);
        	this.div_payInfo.div_acc.cb_B_bankCd.set_enable(false);
        	this.div_payInfo.div_acc.ed_B_acctNo.set_enable(false);
        	
        	this.div_payInfo.btn_payChoice.set_visible(false);
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
        	this.div_carInfo.ed_model00.set_value(this.ds_model.getColumn(nRow,"contentsCd"));
        	this.div_carInfo.ed_model01.set_value(this.ds_model.getColumn(nRow,"frCd"));	
        	this.ds_model.set_rowposition(nRow);
        	this.FN_priceDeleteAll();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : DATASET CLEAR
        this.FN_priceDeleteAll = function(){
        	this.ds_rtsd0013.clearData();
        	this.ds_rtsd0014.clearData();
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //EDIT FUNCTION : 차량번호 변경
        this.div_carInfo_ed_carNo_onchanged = function(obj,e){

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
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //차량정보 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //프리미엄서비스 START - 현재 버튼 비활성화
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        // 프리미엄 서비스횟수 무제한 콤보세팅

        this.prmmSvrComboSet = function(obj,e){
        	if(e.col == 3) {
        		this.ds_svrCnt.filter("cd == '999' || cd == " + this.ds_rtsd0013.getColumn(e.row,"servCntOrg"));
        	}	
        }

        // 프리미엄 서비스횟수 콤보 발생 이벤트 
        this.prmmSvrComboGet = function(obj,e)
        {
        	if(obj.getColumn(e.row, "servCnt") == '999'){
        		obj.setColumn(e.row, "servAmtSum", obj.getColumn(e.row, "servInfAmt"));
        	}else{
        		obj.setColumn(e.row, "servAmtSum", obj.getColumn(e.row, "servAmtSumOrg"));
        	}
        	this.contactRowChg();
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
        //공통 BUTTON START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_add = function(obj,e){
        	if( confirm( "추가 클릭시 기존 입력내용은 사라집니다." ) ){
        		this.reload();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
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

        
        /********************2018.10.25 이후 추가*******************************************/
        //단체계약조회 팝업 호출
        this.btnGrpContSearch_onclick = function(obj,e)
        {
        	var p_argGrpNo = this.ed_grpPkgNum.value;
        	
        	var args ={ p_argGrpNo : p_argGrpNo };
        	Ex.core.popup(this,"단체계약조회","sd::RTSDGroupContractPopup.xfdl",args, "modaless=false");	

        }

        
        //판매상품조회
        this.btn_SalePrdtSearch_onclick = function(obj,e)
        {
        	var args = {p_formId:this.p_arg,p_prdtGrp:"04"}; 
        	Ex.core.popup(this,"판매상품조회","comm::RTCOMMSellProduct_pop.xfdl",args, "modaless=false");
        }

        this._setSaleReturn = function(arg) {
        	var saleCd = nvl(arg[0]);
        	this.ed_SaleCd.set_value(saleCd);	
        	this.grid_product.set_enable(true);
        	this.fn_SalePrdtSearch(); //판매상품조회
        }

        this.fn_SalePrdtSearch = function()
        {
        	var saleCd = nvl(this.ed_SaleCd.value);
        	var sSvcID        	= "saleItemList";                    
        	var sController   	= "/ntrms/sd/saleItemList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sOutDatasets		+= " ds_saleItemList=saleItemOutput";
        	
        	sArgs += Ex.util.setParam("saleCd", 		saleCd);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
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
        		if(nvl(this.ds_contactDeliInfo.getColumn(i,"regiAmt"),0) == "") {
        			cRegiAmt = parseInt(cRegiAmt) + 0;
        		} else {
        			cRegiAmt = parseInt(cRegiAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i,"regiAmt"));
        		}
        	}
        			
        	for (var i=0; i<3; i++) {
        		//this.alert("regiAmt : " + this.regiAmt*i);
        		this.ds_RegAmtMgnt.setColumn(i,"cd", cRegiAmt*i);
        		this.ds_RegAmtMgnt.setColumn(i,"cdNm", cRegiAmt*i);
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
        		
        	/*this.alert("modelCd : " + modelCd + "  ordNo : " + ordNo + "  saleCd : " + saleCd);*/
        	
        	var sSvcID        	= "listAddSelProduct2";                    
        	var sController   	= "/rtms/sd/listAddSelProduct2.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_productInfo=listAddSelProduct2";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo",   ordNo);			// 계약번호
        	sArgs += Ex.util.setParam("modelCd", modelCd);			// 모델코드
        	sArgs += Ex.util.setParam("saleCd", saleCd);			// 판매코드
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        // 계약번호별 프리미엄 서비스  정보조회
        this.fn_searchPrmmSrvc = function(){
        	
        	var sSvcID        	= "prmmSrvcOrdList";                    
        	var sController   	= "/rtms/sd/prmmSrvcOrdList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0013=prmmSrvcOrdList";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo",   this.ed_orderNo.value);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        // 상품별 프리미엄 서비스 정보조회 
        this.fn_getPrmmSrvc = function(){

        	var saleCd = nvl(this.ed_SaleCd.value);
        	var periodCd = nvl(this.p_periodCd.value);
        	var cntCd = nvl(this.p_cntCd.value);

        	var sSvcID        	= "srvcOrdList";                    
        	var sController   	= "rtms/comm/srvcOrdList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0013=srvcOrdListMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_rtsd0013.clearData();  // dataset clear 한다.
        	sArgs += Ex.util.setParam("p_saleCd", saleCd);		// 판매코드
        	sArgs += Ex.util.setParam("p_periodCd", periodCd);	// 장착개월수
        	sArgs += Ex.util.setParam("p_cntCd", cntCd);		// 타이어본수
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.fn_getSumpay = function(){

        	var saleCd = nvl(this.ed_SaleCd.value);
        	var periodCd = nvl(this.p_periodCd.value);
        	var cntCd = nvl(this.p_cntCd.value);

        	var sSvcID        	= "Sumpay";                    
        	var sController   	= "rtms/sd/Sumpay.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("saleCd", saleCd);		// 판매코드
        	sArgs += Ex.util.setParam("periodCd", periodCd);	// 장착개월수
        	sArgs += Ex.util.setParam("cntCd", cntCd);		// 타이어본수
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.contactRowChg = function()
        {
        	var sPeriod			= 0;
        	if(nvl(this.p_periodCd.value) == '') {
        		sPeriod = 0;
        	} else {
        		sPeriod = this.p_periodCd.value;
        	}
        	
        	//trace("sPeriod:"+sPeriod);
        	var sum =0;
        	if( sPeriod > 0) {
        // 		for(var i=0;i<this.ds_rtsd0013.getRowCount();i++){
        // 		}
        	this.div_sumInfo.ed_totalPrice.set_value(nvl(this.addComma(this.mathFloor(this.Sumpay))));		
        	}
        }

        this.grid_product_oncloseup = function(obj,e)
        {
        	this.fn_getPrmmSrvc();
        	this.fn_getSumpay();	
        }

        this.btnOrderAdd_onclick = function(obj,e)
        {

        	var nRow0100 = this.ds_rtsd0100.rowposition;
        	
        	var nRow0104				= this.ds_rtsd0104.rowposition;
        	var nRow0106 				= this.ds_rtsd0106.rowposition;
        	
        	var contactRowType 			= this.ds_rtsd0104.getRowType(nRow0104);
        	var contractProductRowType 	= this.ds_rtsd0106.getRowType(nRow0106);
        	
        	var modelRow 				= this.ds_model.rowposition;
        	
        	var chanCd 		= nvl(this.ds_rtsd0104.getColumn(nRow0104, "chanCd"));
        	var statCd 		= nvl(this.ds_rtsd0104.getColumn(nRow0104, "statCd"));
        	
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

        	var regId  = nvl(this.ds_rtsd0104.getColumn(nRow0104, "regId"));
        	
        	var resultPayInfo = this.ch_resultPayInfo.value;
        	
        // 	if( statCd=="03" || statCd=="04" || statCd=="06" ){
        // 		alert("장착대기, 장착완료, 계약취소 정보는 수정  처리가 불가 합니다!");
        // 		return false;
        // 	}
        	
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
        	
        	var carNo = nvl(this.ds_rtsd0104.getColumn(nRow0104, "carNo"));
        	if( carNo == "" ){
        		alert("차량No" + msg);
        		return false;
        	}
        	
        	
        	var saleCd = this.ed_SaleCd.value;
        	if( saleCd == "" ){
        		alert("판매상품명" + msg);
        		return false;
        	}
        	
        	var matCd = this.p_matCd.value;
        	if( matCd == "" ){
        		alert("상품명" + msg);
        		return false;
        	}
        	var periodCd = this.p_periodCd.value;
        	if( periodCd == "" ){
        		alert("렌탈기간" + msg);
        		return false;
        	}
        	
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
        			this.ds_rtsd0104.setColumn( nRow0104, "accChk", "N");															//계좌확인상태
        			this.ds_rtsd0104.setColumn( nRow0104, "bkeyChk",this.ch_resultPayInfo.value == true ? "Y" : "N");				//배치키생성여부(카드)
        		}else{
        			alert("결제방법 코드 : ERROR");
        			return this.div_payInfo.cb_payMthd.setFocus(true);
        		}
        	}	

        
        														
        	var ordAgent = nvl(this.ds_rtsd0104.getColumn(nRow0104, "ordAgent"));													//판매인번호
        	var regId   = nvl( this.ds_rtsd0100.getColumn(0,"regId")  );
        	var custTp  = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );
        	if(custTp==01){

        	}
        	else if(custTp==02){
        	this.ds_rtsd0100.setColumn( nRow0100,"custNm");
        	this.ds_rtsd0100.setColumn( nRow0100,"birthDay","");
        	}

        	this.ds_rtsd0104.setColumn( nRow0104, "contentsCd", 	contentsCd);										//사양
        	this.ds_rtsd0104.setColumn( nRow0104, "frCd", 			frCd); 								//전후 구분
        	this.ds_rtsd0104.setColumn( nRow0104, "chanCd","11");
        	this.ds_rtsd0104.setColumn( nRow0104, "saleId","09");
        	this.ds_rtsd0104.setColumn( nRow0104, "periodCd",		nvl(this.p_periodCd.value) );						//기간코드		
        	this.ds_rtsd0104.setColumn( nRow0104, "saleCd",			nvl(this.ed_SaleCd.value) );							//판매코드
        	this.ds_rtsd0104.setColumn( nRow0104, "payGb", "1" ); 														//납부구분	
        	this.ds_rtsd0104.setColumn( nRow0104, "empNo",			"" ); 												//사원번호
        	this.ds_rtsd0104.setColumn( nRow0104, "regiAmt","0");
        	this.ds_rtsd0104.setColumn( nRow0104, "sumMonAmt",nvl(this.delComma(this.div_sumInfo.ed_totalPrice.value)));
        	this.ds_rtsd0104.setColumn( nRow0104, "monAmt",nvl(this.delComma(this.div_sumInfo.ed_totalPrice.value)));
        	
        	this.ds_rtsd0104.setColumn( nRow0104, "cntCd" ,nvl(this.p_cntCd.value) );				//타이어본수	
        	this.ds_rtsd0104.setColumn( nRow0104, "regiCd",			"ZZZZ");			//등록비코드 - 이제사용안함 렌탈등록비가 대처

        	this.ds_rtsd0104.setColumn( nRow0104, "custNo",			nvl(this.ds_rtsd0100.getColumn(nRow0100,"custNo")) );			//고객번호
        	this.ds_rtsd0104.setColumn( nRow0104, "custTp",			nvl(this.ds_rtsd0100.getColumn(nRow0100, "custTp")) );			//고객유형
        	this.ds_rtsd0104.setColumn( nRow0104, "safekey",		nvl(this.ds_rtsd0100.getColumn(nRow0100, "safekey")) );			//인증번호
        	this.ds_rtsd0104.setColumn( nRow0104, "campYn",			"N" );			//캠페인적용여부
        	this.ds_rtsd0104.setColumn( nRow0104, "cDcamt",			"0" );			//캠페인할인금액
        	this.ds_rtsd0104.setColumn( nRow0104, "cDcrate",		"" );			//캠페인할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "gDcrate",		"" );			//결합할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "gDcamt",			"0" );			//결합할인액
        	this.ds_rtsd0104.setColumn( nRow0104, "lDcrate",		"10" );			//제한할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "lDcamt",			"0" );			//제한할인액
        	this.ds_rtsd0104.setColumn( nRow0104, "fDcrate",		"" );			//최종할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "fDcamt",			"0" );			//최종할인액
        	
        	this.ds_rtsd0104.setColumn( nRow0104, "payDd", 			payDd);															//이체일
        	this.ds_rtsd0104.setColumn( nRow0104, "fcDay", "")																	//최초청구일자
        	this.ds_rtsd0104.setColumn( nRow0104, "inputDt", "")																	//PAD입력일시
        	this.ds_rtsd0104.setColumn( nRow0104, "filePath", "")																	//계약서 파일경로
        	this.ds_rtsd0104.setColumn( nRow0104, "fileName", "")																	//계약서 파일명
        	//this.ds_rtsd0104.setColumn( nRow0104, "psCd", nvl(this.ds_rtsd0013.getColumn(0, "psCd")));								//프리미엄서비스코드
        	//this.ds_rtsd0104.setColumn( nRow0104, "seasonCd", nvl(this.ds_price.getColumn(0, "seasonCd")));							//계절구분
        	this.ds_rtsd0104.setColumn( nRow0104, "grpYn", "N" );																//단체여부
        	this.ds_rtsd0104.setColumn( nRow0104, "grpNo" );										//단체구분
        	//this.ds_rtsd0104.setColumn( nRow0104, "psCd", nvl(this.ds_rtsd0104.getColumn(0, "psCd")));						//프리미엄서비스코드
        	this.ds_rtsd0104.setColumn( nRow0104, "psCd", "999999" );															//프리미엄서비스코드
        	this.ds_rtsd0104.setColumn( nRow0104, "seasonCd");					//계절구분
        //this.alert("contactRowType : " + contactRowType  +  "  payStatCd : " + this.payStatCd + "  statCd : " + statCd);		

        	this.ds_rtsd0104.setColumn( nRow0104, "statCd", "04");															//"01" : 계약접수
        	this.ds_rtsd0104.setColumn( nRow0104, "bordNo", nvl(this.ed_orderNo.value)==""?this.getcheckOrdNo:nvl(this.ed_orderNo.value) );
        	this.ds_rtsd0104.setColumn( nRow0104, "ordNo", "");
        	
        	if( contactRowType =="2" ){ // 신규일경우
        		this.ds_rtsd0104.setColumn( nRow0104, "ordId", "04");																//계약구분 : 렌탈
        		this.ds_rtsd0104.setColumn( nRow0104, "ordDay",this.toDay);
        		this.ds_rtsd0104.setColumn( nRow0104, "chanCd","11");		
        		this.ds_rtsd0104.setColumn( nRow0104, "billYn", "N");																//세금계산서발행여부
        		this.ds_rtsd0104.setColumn( nRow0104, "periodCd",		nvl(this.p_periodCd.value) );						//기간코드		
        		this.ds_rtsd0104.setColumn( nRow0104, "saleCd",			nvl(this.ed_SaleCd.value) );							//판매코드
        		this.ds_rtsd0104.setColumn( nRow0104, "agDay", nvl(this.ds_rtsd0111.getColumn(0, "agDay")));						//개인정보제공동의일
        		this.ds_rtsd0104.setColumn( nRow0104, "agSeq", nvl(this.ds_rtsd0111.getColumn(0, "seq")));							//개인정보제공동의순번
        		this.ds_rtsd0104.setColumn( nRow0104, "cmsagYn","N");																//CMS출금이제동의
        		this.ds_rtsd0104.setColumn( nRow0104, "certStat","Y" );																//본인인증상태
        		this.ds_rtsd0104.setColumn( nRow0104, "saleId",  "09");															//계약유형 : 일반
        		this.ds_rtsd0104.setColumn( nRow0104, "grpYn", "N");																//고객결합여부
        		this.ds_rtsd0104.setColumn( nRow0104, "grpNo" ,"");																	//고객결합번호
        		this.ds_rtsd0104.setColumn( nRow0104, "fDcrate" ,"");																//최종할인율
        		this.ds_rtsd0104.setColumn( nRow0104, "cDcrate" ,"");																//캠페인할인율
        		this.ds_rtsd0104.setColumn( nRow0104, "payMthd", payMthd );														//결제구분
        		this.ds_rtsd0104.setColumn( nRow0104, "ordNo");																	//계약번호
        		
        		
        		this.ds_rtsd0104.setColumn( nRow0104, "fDcrate" ,"");			//최종할인율
        																//이전주문번호
        		this.ds_rtsd0104.setColumn( nRow0104, "procDay" ,"");																//장착일자
        		this.ds_rtsd0104.setColumn( nRow0104, "cancDay" ,"");																//취소일자
        		this.ds_rtsd0104.setColumn( nRow0104, "agencyCd" ,"");																//장착 대리점
        													//지사
        		this.ds_rtsd0104.setColumn( nRow0104, "engNm" ,"");																	//장착기사
        		this.ds_rtsd0104.setColumn( nRow0104, "agDesc" ,"");    															//특이사항(장착점")
        																		//차량번호
        																	//차량소유자
        																	//현재주행거리
        		this.ds_rtsd0104.setColumn( nRow0104, "reqText","");																//비고(기타정보)
        		this.ds_rtsd0104.setColumn( nRow0104, "accSeq","");																	//계좌순번
        		this.ds_rtsd0104.setColumn( nRow0104, "crdSeq","");																	//카드순번
        		this.ds_rtsd0104.setColumn( nRow0104, "crdtStat","");																//신용조회상태
        		this.ds_rtsd0104.setColumn( nRow0104, "certCd","");																	//본인인증방법
        		this.ds_rtsd0104.setColumn( nRow0104, "orgCd","");																	//판매조직
        		this.ds_rtsd0104.setColumn( nRow0104, "orgHq","");																	//판매본부
        		this.ds_rtsd0104.setColumn( nRow0104, "orgL1","");																	//판매조직-1LV
        		this.ds_rtsd0104.setColumn( nRow0104, "orgL2","");																	//판매조직-2LV
        		this.ds_rtsd0104.setColumn( nRow0104, "orgL3","");																	//판매조직-3LV
        		this.ds_rtsd0104.setColumn( nRow0104, "orgL4","");																	//판매조직-4LV
        		this.ds_rtsd0104.setColumn( nRow0104, "insOrg","");																	//입력조직
        		this.ds_rtsd0104.setColumn( nRow0104, "tcgrpNo","");																//통합청구번호
        		this.ds_rtsd0104.setColumn( nRow0104, "vbeln","");																//SO번호
        		this.ds_rtsd0104.setColumn( nRow0104, "regId","");																//등록자 ID
        		
        		this.ds_rtsd0104.setColumn( nRow0104, "conMthd","");
        		this.ds_rtsd0104.setColumn( nRow0104, "ordAgent","");
        		this.ds_rtsd0104.setColumn( nRow0104, "pcertYn","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "seasonCd","");
        		
        	} else if(contactRowType =="1"){

        		this.ds_rtsd0104.setColumn( nRow0104, "ordId", "04");
        		this.ds_rtsd0104.setColumn( nRow0104, "ordNo", "");
        		this.ds_rtsd0104.setColumn( nRow0104, "saleNm", nvl(this.ed_SaleProdNm.value));
        	}	

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
        	
        	this.FN_goSave();
        }
        //------------ 저장  -------------------------------------------------------------------------------

        
        this.FN_goSave = function(){
        	
        	var ds_productInfo = this.ds_productInfo.getRowCount();
        	this.ds_productInfo.set_updatecontrol(false);
        	for( var i = 0 ; i < this.ds_productInfo.getRowCount() ; i++){
        		
        		//------- 저장시 외부 입력값들 --------
        		this.ds_productInfo.setColumn(i, "saleCd", this.ed_SaleCd.value);		// 판매코드
        		this.ds_productInfo.setColumn(i, "gdsGb", "1");  	// 제품구분
        		this.ds_productInfo.setColumn(i, "gdsGrp", "1");  	// 제품군
        		
        		this.ds_productInfo.setColumn(i, "matNm", ""); // 제품명를 null 처리 한다. 깨짐..
        		this.ds_productInfo.setColumn(i, "saleGdsCd", ""); // 상품코드 null 처리 한다. 깨짐..	
        		
        		this.ds_productInfo.setColumn( i, "ordId","04");														//	주문구분 01:렌탈 S029
        		this.ds_productInfo.setColumn( i, "instYn", "N");														//	장착여부
        		this.ds_productInfo.setColumn( i, "valYn", "N");														//	유효여부
        		this.ds_productInfo.setColumn( i, "osId", "N");															//	소유권이전구분
        		this.ds_productInfo.setColumn( i, "regiCd", "ZZZZ");														//
        		this.ds_productInfo.setColumn( i, "statCd", "04");														//	상태 : S032
        		this.ds_productInfo.setColumn( i, "flYn", "N");															//	장착위-앞,왼쪽
        		this.ds_productInfo.setColumn( i, "frYn", "N");															//	장착위치-앞,오른쪽
        		this.ds_productInfo.setColumn( i, "rlYn", "N");															//	장착위치-뒤,왼쪽
        		this.ds_productInfo.setColumn( i, "rrYn", "N");															//	장착위치-뒤,오른쪽
        		this.ds_productInfo.setColumn( i, "ordNo","");															//	계약번호
        		this.ds_productInfo.setColumn( i, "seq","");																//	순번
        		this.ds_productInfo.setColumn( i, "lrCd", "");															//	좌우
        		this.ds_productInfo.setColumn( i, "rentpAmt","");														//	추가렌탈료(프리미엄서비스)
        		this.ds_productInfo.setColumn( i, "fDcrate","");														//	최종할인율
        		this.ds_productInfo.setColumn( i, "planTm","");															//	장착예정시간(HHMM)
        		this.ds_productInfo.setColumn( i, "instDay","");														//	장착일
        		this.ds_productInfo.setColumn( i, "instTm","");															//	장착시간(HHMM)
        		this.ds_productInfo.setColumn( i, "equNo", "");															//	설비번호
        		this.ds_productInfo.setColumn( i, "osDay", "");															//	소유권이전일자(예정)
        			
        		this.ds_productInfo.setColumn( i, "regId", "");															//	등록자 ID 
        		this.ds_productInfo.setColumn( i, "regDt", "");															//	등록일
        		this.ds_productInfo.setColumn( i, "chgId", "");															//	변경자 ID 
        		this.ds_productInfo.setColumn( i, "chgDt", "");
        		this.ds_productInfo.setColumn( i, "frCd", "Z");

        		//---------------------------------------
        		this.ds_productInfo.setRowType(i, Dataset.ROWTYPE_INSERT);
        		
        	}
        	this.ds_productInfo.set_updatecontrol(true);
        	
        	
        	var cnt = this.ds_rtsd0013.getRowCount();
        	if( cnt != 0 ){
        		for( var i = 0; i < cnt; i++){
        			this.ds_rtsd0013.setColumn(i, "servCnt0", this.ds_rtsd0013.getColumn(i, "servCnt"));
        			this.ds_rtsd0013.setColumn(i, "servCntr", this.ds_rtsd0013.getColumn(i, "servCnt"));
        			this.ds_rtsd0013.setColumn(i, "psCd", "999999");
        		}
        	}
        	
        	this.ds_rtsd0013.set_updatecontrol(false);
        	for( var i = 0 ; i < cnt ; i++){
        		this.ds_rtsd0013.setRowType(i, Dataset.ROWTYPE_INSERT);
        	}
        	this.ds_rtsd0013.set_updatecontrol(true);

        	if( confirm( "저장하시겠습니까?") ){
        	
        			
        		var sSvcID        	= "saveMemberOrder";                    
        		var sController   	= "/rtms/sd/saveMemberOrder.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		
        		sInDatasets   		+= " dsRtsd0100=ds_rtsd0100:A ";
        		sInDatasets   		+= " dsRtsd0104=ds_rtsd0104:A ";
        		sInDatasets			+= " dsRtsd0106=ds_productInfo:A ";
        		sInDatasets			+= " dsRtsd0013=ds_rtsd0013:A ";
        		sInDatasets			+= " dsRtre0010=ds_rtre0010:A ";
        		sInDatasets			+= " dsRtre0020=ds_rtre0020:A ";		

        				
        				
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        // 콤마추가
        this.addComma = function(num) {
        	num+="";	
        	if(num=="" || num=="0") return num;
        	var pattern = /(-?[0-9]+)([0-9]{3})/;
        	while(pattern.test(num)) {
        		num = num.replace(pattern,"$1,$2");
        	}
        	return num;
        }

        // 콤마제거
        this.delComma = function(num) {
        	if(num==NaN) return "";
        	if(num=="" || num=="0") return num;
        	if(num==undefined) return "";
        	var strNum = new String(num);
        	var rtnNum = strNum.replace(/\,/g,""); 
        	return rtnNum;
        }
        // 10단위 절삭
        this.mathFloor = function(num){
        	num = Math.floor(eval(num)/10)*10;	
        	return num;
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_model.addEventHandler("onrowposchanged", this.ds_model_onrowposchanged, this);
            this.ds_ValuePrdtInfo.addEventHandler("oncolumnchanged", this.saleMonAmtChg, this);
            this.ds_sumPayInfo.addEventHandler("oncolumnchanged", this.setRegiAmt, this);
            this.ds_rtsd0013.addEventHandler("oncolumnchanged", this.prmmSvrComboGet, this);
            this.addEventHandler("onload", this.RTSDMemberOrder_onload, this);
            this.grid_svrCd.addEventHandler("oncellclick", this.prmmSvrComboSet, this);
            this.grid_product.addEventHandler("oncloseup", this.grid_product_oncloseup, this);
            this.ra_sale.addEventHandler("onitemchanged", this.ra_sale_onitemchanged, this);
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
            this.div_custInfo.cb_custTp.addEventHandler("onitemchanged", this.div_custInfo_cb_custTp_onitemchanged, this);
            this.div_custInfo.btn_custNew.addEventHandler("onclick", this.div_custInfo_btn_custNew_onclick, this);
            this.div_custInfo.btn_custNoSearch.addEventHandler("onclick", this.div_custInfo_btn_custNoSearch_onclick, this);
            this.div_custInfo.div_custInfoDetail.btn_creditSelect.addEventHandler("onclick", this.div_custInfo_div_custInfoDetail_btn_creditSelect_onclick, this);
            this.div_custInfo.div_custInfoDetail.btn_certification.addEventHandler("onclick", this.div_cust_btn_certificationConfirm_onclick, this);
            this.div_custInfo.div_custInfoDetail.nice_interface.addEventHandler("onusernotify", this.web_onusernotify, this);
            this.div_custInfo.ed_cTelno.addEventHandler("onkeyup", this.div_cust_ed_cTelno_onkeyup, this);
            this.div_carInfo.cb_makerCd.addEventHandler("onitemchanged", this.div_carInfo_cb_makerCd_onitemchanged, this);
            this.div_carInfo.cb_model.addEventHandler("onitemchanged", this.div_carInfo_cb_model_onitemchanged, this);
            this.div_carInfo.ed_carOwner.addEventHandler("onkeyup", this.div_carInfo_ed_carOwner_onkeyup, this);
            this.div_carInfo.ed_carNo.addEventHandler("onkeyup", this.div_carInfo_ed_carNo_onkeyup, this);
            this.div_carInfo.ed_carNo.addEventHandler("onchanged", this.div_carInfo_ed_carNo_onchanged, this);
            this.div_carInfo.ed_cMileage.addEventHandler("onchanged", this.div_carInfo_ed_cMileage_onchanged, this);
            this.btn_SalePrdtSearch.addEventHandler("onclick", this.btn_SalePrdtSearch_onclick, this);
            this.btn_orderNoSearch.addEventHandler("onclick", this.btn_orderNoSearch_onclick, this);
            this.btnOrderAdd.addEventHandler("onclick", this.btnOrderAdd_onclick, this);

        };

        this.loadIncludeScript("RTSDMemberOrder.xfdl");

       
    };
}
)();
