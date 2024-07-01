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
                this.set_name("RTSDDirectOrder");
                this.set_classname("RTSDOrderRegister");
                this.set_scrollbars("autoboth");
                this.set_titletext("일시불 주문등록");
                this._setFormPosition(0,0,1147,1388);
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

            obj = new Dataset("ds_maker", this);
            obj.set_useclientlayout("true");
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
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custTp3\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum1\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleId\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"campYn\" type=\"STRING\" size=\"256\"/><Column id=\"cDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"bordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/><Column id=\"crdtStat\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"certStat\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgHq\" type=\"STRING\" size=\"256\"/><Column id=\"orgL1\" type=\"STRING\" size=\"256\"/><Column id=\"orgL2\" type=\"STRING\" size=\"256\"/><Column id=\"orgL3\" type=\"STRING\" size=\"256\"/><Column id=\"orgL4\" type=\"STRING\" size=\"256\"/><Column id=\"insOrg\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"cmsagYn\" type=\"STRING\" size=\"256\"/><Column id=\"conMthd\" type=\"STRING\" size=\"256\"/><Column id=\"pcertYn\" type=\"STRING\" size=\"256\"/><Column id=\"tcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"fcDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDay\" type=\"STRING\" size=\"256\"/><Column id=\"agSeq\" type=\"STRING\" size=\"256\"/><Column id=\"inputDt\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrp\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanCode\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGb\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"payGb\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"sumMonAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_saleItemList", this);
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleStrDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleEndDay\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGb\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrp\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"pkgDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"preDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"fpayYn\" type=\"STRING\" size=\"256\"/><Column id=\"fpayYnNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiCalGb\" type=\"STRING\" size=\"256\"/><Column id=\"regiCalGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpSaleGb\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"grpSaleGbNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_productInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"chnlSale\" type=\"STRING\" size=\"256\"/><Column id=\"groupSale\" type=\"STRING\" size=\"256\"/><Column id=\"reRentalSaleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"employeeSaleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"lrCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"rentpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"valYn\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"osId\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"flYn\" type=\"STRING\" size=\"256\"/><Column id=\"frYn\" type=\"STRING\" size=\"256\"/><Column id=\"rlYn\" type=\"STRING\" size=\"256\"/><Column id=\"rrYn\" type=\"STRING\" size=\"256\"/><Column id=\"matDesc\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGb\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ValuePrdtInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsNm\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"actAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcYn\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/><Column id=\"gdsDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_svrCnt", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">1회</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">2회</Col></Row><Row><Col id=\"cd\">3</Col><Col id=\"cdNm\">3회</Col></Row><Row><Col id=\"cd\">4</Col><Col id=\"cdNm\">4회</Col></Row><Row><Col id=\"cd\">5</Col><Col id=\"cdNm\">5회</Col></Row><Row><Col id=\"cd\">6</Col><Col id=\"cdNm\">6회</Col></Row><Row><Col id=\"cd\">7</Col><Col id=\"cdNm\">7회</Col></Row><Row><Col id=\"cd\">8</Col><Col id=\"cdNm\">8회</Col></Row><Row><Col id=\"cd\">9</Col><Col id=\"cdNm\">9회</Col></Row><Row><Col id=\"cd\">999</Col><Col id=\"cdNm\">무제한</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_seq", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"seq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0013", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"servInfAmt\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servAmtSum\" type=\"STRING\" size=\"256\"/><Column id=\"servAmtSumOrg\" type=\"STRING\" size=\"256\"/><Column id=\"servCntOrg\" type=\"STRING\" size=\"256\"/><Column id=\"servInfYN\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt1\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt2\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt3\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt4\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt5\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt6\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt7\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt8\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt9\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt10\" type=\"STRING\" size=\"256\"/><Column id=\"servCntTemp\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0401", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"reqDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statDtlCd\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_seviceCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_custInfo", "absolute", "0", "40", "549", "107", null, null, this);
            obj.set_taborder("3");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "-1", "30", "543", "31", null, null, this.div_custInfo);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "232", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("2");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "336", "35", "124", "21", null, null, this.div_custInfo);
            obj.set_taborder("0");
            obj.set_maxlength("80");
            obj.set_imemode("hangul");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Button("btn_custNoSearch", "absolute", "466", "35", "65", "21", null, null, this.div_custInfo);
            obj.set_taborder("3");
            obj.set_text("고객조회");
            obj.getSetter("domainId").set("nexa.save");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "5", "80", "21", null, null, this.div_custInfo);
            obj.set_taborder("4");
            obj.set_text("고객정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "60", "543", "31", null, null, this.div_custInfo);
            obj.set_taborder("5");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_birthDay", "absolute", "0", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("6");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_birthDay", "absolute", "104", "65", "124", "21", null, null, this.div_custInfo);
            obj.set_taborder("7");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            obj.set_enable("true");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "232", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("8");
            obj.set_text("휴대폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_mobNo", "absolute", "336", "65", "124", "21", null, null, this.div_custInfo);
            obj.set_taborder("9");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            obj.set_enable("true");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_custTp", "absolute", "0", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("10");
            obj.set_text("고객유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Combo("cb_custTp", "absolute", "104", "35", "124", "21", null, null, this.div_custInfo);
            this.div_custInfo.addChild(obj.name, obj);
            obj.set_taborder("11");
            obj.set_innerdataset("@ds_custTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("true");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_buslNo", "absolute", "0", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("12");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_buslNo", "absolute", "104", "65", "124", "21", null, null, this.div_custInfo);
            obj.set_taborder("13");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "432", "5", "110", "21", null, null, this.div_custInfo);
            obj.set_taborder("14");
            obj.set_visible("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_repNm", "absolute", "232", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("15");
            obj.set_text("대표자명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_repNm", "absolute", "336", "35", "124", "21", null, null, this.div_custInfo);
            obj.set_taborder("16");
            obj.set_maxlength("80");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new CheckBox("ch_birthDayAndBuslNoCh", "absolute", "338", "5", "190", "20", null, null, this.div_custInfo);
            obj.set_taborder("17");
            obj.set_text("법정생년월일&사업자번호체크");
            obj.set_value("true");
            obj.set_visible("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Combo("cb_custTp2", "absolute", "231", "3", "103", "21", null, null, this.div_custInfo);
            this.div_custInfo.addChild(obj.name, obj);
            obj.set_taborder("18");
            obj.set_innerdataset("ds_custTp2");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("ed_taxYn", "absolute", "167", "4", "120", "20", null, null, this.div_custInfo);
            obj.set_taborder("19");
            obj.set_displaynulltext("개인사업자 면세여부");
            obj.set_visible("false");
            this.div_custInfo.addChild(obj.name, obj);

            obj = new Grid("grid_model", "absolute", "0", "1392", "679", "62", null, null, this);
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

            obj = new Static("Static04", "absolute", "0", "153", "89", "21", null, null, this);
            obj.set_taborder("67");
            obj.set_text("판매정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "177", "440", "31", null, null, this);
            obj.set_taborder("82");
            obj.set_text("Static05");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_SalePrdtNm", "absolute", "120", "177", "87", "31", null, null, this);
            obj.set_taborder("84");
            obj.set_text("판매상품명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_BtnSalePrdt", "absolute", "0", "177", "121", "31", null, null, this);
            obj.set_taborder("85");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_SaleCd", "absolute", "71.93%", "175", null, "21", "15.61%", null, this);
            obj.set_taborder("90");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_SalePrdtSearch", "absolute", "15", "182", "89", "21", null, null, this);
            obj.set_taborder("91");
            obj.set_text("판매상품조회");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "269", "89", "21", null, null, this);
            obj.set_taborder("92");
            obj.set_text("제품정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "291", null, "157", "12", null, this);
            obj.set_taborder("93");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_productInfo");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"91\"/><Column size=\"86\"/><Column size=\"288\"/><Column size=\"84\"/><Column size=\"103\"/><Column size=\"81\"/><Column size=\"110\"/><Column size=\"91\"/><Column size=\"108\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"상품코드\"/><Cell col=\"2\" text=\"장착위치\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"렌탈기간\"/><Cell col=\"5\" text=\"계절구분\"/><Cell col=\"6\" text=\"본수\"/><Cell col=\"7\" text=\"렌탈등록비\"/><Cell col=\"8\" text=\"렌탈료\"/><Cell col=\"9\" text=\"판매채널할인\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:matCd\"/><Cell col=\"2\" text=\"bind:frNm\"/><Cell col=\"3\" text=\"bind:matNm\"/><Cell col=\"4\" text=\"bind:periodNm\"/><Cell col=\"5\" text=\"bind:seasonNm\"/><Cell col=\"6\" text=\"bind:cntNm\"/><Cell col=\"7\" displaytype=\"number\" text=\"bind:regiAmt\"/><Cell col=\"8\" displaytype=\"number\" text=\"bind:rentAmt\"/><Cell col=\"9\" displaytype=\"number\" text=\"bind:chnlSale\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btnAddPrdt", "absolute", "1001", "262", "71", "22", null, null, this);
            obj.set_taborder("94");
            obj.set_text("제품추가");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btnAddPrdtDel", "absolute", "1077", "262", "45", "22", null, null, this);
            obj.set_taborder("95");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "0%", "500", null, "157", "12", null, this);
            obj.set_taborder("96");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_ValuePrdtInfo");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"17\"/><Column size=\"84\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"30\"/><Column size=\"62\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"부가제품명\"/><Cell col=\"2\" text=\"금액\"/><Cell col=\"3\" text=\"할인금액\"/><Cell col=\"4\" text=\"실판매가\"/><Cell col=\"5\" text=\"할부\"/><Cell col=\"6\" style=\"padding: ;\" text=\"월렌탈료\"/><Cell col=\"7\" text=\"제조사\"/><Cell col=\"8\" text=\"제품군\"/><Cell col=\"9\" text=\"특징\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:addGdsNm\"/><Cell col=\"2\" displaytype=\"number\" style=\"align:right;padding:0 6 0 0;\" text=\"bind:amt\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;padding:0 3 0 0;\" text=\"bind:dcAmt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;padding:0 5 0 0;\" text=\"bind:actAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:dcYn\" combodataset=\"ds_dcYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;padding:0 4 0 0;\" text=\"bind:monAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:makerNm\"/><Cell col=\"8\" displaytype=\"combo\" style=\"align:left;\" text=\"bind:gdsGrp\" combodataset=\"comGrp\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"9\" style=\"align:left;\" text=\"bind:gdsDesc\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "477", "101", "21", null, null, this);
            obj.set_taborder("97");
            obj.set_text("부가제품정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btnValuePrdtAdd", "absolute", null, "472", "97", "22", "62", null, this);
            obj.set_taborder("98");
            obj.set_text("부가제품추가");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btnValuePrdtDel", "absolute", "1077", "472", "45", "22", null, null, this);
            obj.set_taborder("99");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "688", "111", "21", null, null, this);
            obj.set_taborder("100");
            obj.set_text("프리미엄서비스");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("p_periodCd", "absolute", "8.37%", "266", null, "20", "82.91%", null, this);
            obj.set_taborder("108");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_preminum", "absolute", "-2", "1394", "529", "170", null, null, this);
            obj.set_taborder("109");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_SaleProdNm", "absolute", "213", "183", "220", "20", null, null, this);
            obj.set_taborder("111");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_carInfo", "absolute", "596", "40", "422", "140", null, null, this);
            obj.set_taborder("114");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "30", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_model", "absolute", "0", "30", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("1");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Combo("cb_makerCd", "absolute", "104", "35", "107", "21", null, null, this.div_carInfo);
            this.div_carInfo.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_innerdataset("@ds_maker");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Combo("cb_model", "absolute", "215", "35", "202", "21", null, null, this.div_carInfo);
            this.div_carInfo.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_displaynulltext("모델");
            obj.set_innerdataset("@ds_model");
            obj.set_codecolumn("rn");
            obj.set_datacolumn("mcNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static00", "absolute", "0", "60", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("4");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "104", "65", "107", "21", null, null, this.div_carInfo);
            obj.set_taborder("7");
            obj.set_maxlength("9");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "0", "60", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("8");
            obj.set_text("차량No");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_model", "absolute", "103", "5", "120", "21", null, null, this.div_carInfo);
            obj.set_taborder("12");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "5", "80", "21", null, null, this.div_carInfo);
            obj.set_taborder("13");
            obj.set_text("차량정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_frCd", "absolute", "380", "5", "37", "21", null, null, this.div_carInfo);
            obj.set_taborder("15");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_contentsCd", "absolute", "228", "6", "85", "21", null, null, this.div_carInfo);
            obj.set_taborder("16");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);

            obj = new Div("div_sumInfo", "absolute", null, "816", "680", "120", "-69", null, this);
            obj.set_taborder("115");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Div("Div00", "absolute", "-82.94%", "253", null, "150", "149.85%", null, this.div_sumInfo);
            obj.set_taborder("20");
            obj.set_text("Div00");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "22", "554", "31", null, null, this.div_sumInfo);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "0", "22", "70", "31", null, null, this.div_sumInfo);
            obj.set_taborder("22");
            obj.set_text("총금액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "-4", "120", "21", null, null, this.div_sumInfo);
            obj.set_taborder("24");
            obj.set_text("결제정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Edit("ed_totalPrice", "absolute", "77", "27", "100", "21", null, null, this.div_sumInfo);
            obj.set_taborder("25");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_inputtype("number");
            obj.set_displaynulltext("0");
            obj.style.setStyleValue("align", "disabled", "right middle");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "186", "22", "70", "31", null, null, this.div_sumInfo);
            obj.set_taborder("26");
            obj.set_text("할인금액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Edit("ed_DcPrice", "absolute", "261", "27", "83", "21", null, null, this.div_sumInfo);
            obj.set_taborder("27");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_displaynulltext("0");
            obj.set_inputtype("number");
            obj.style.setStyleValue("align", "disabled", "right middle");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Edit("ed_SumtotalPrice", "absolute", "445", "27", "102", "21", null, null, this.div_sumInfo);
            obj.set_taborder("28");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_inputtype("number");
            obj.set_displaynulltext("0");
            obj.style.setStyleValue("align", "disabled", "right middle");
            this.div_sumInfo.addChild(obj.name, obj);
            obj = new Static("st_procDay00", "absolute", "348", "22", "92", "31", null, null, this.div_sumInfo);
            obj.set_taborder("29");
            obj.set_text("총 납부금액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_wordwrap("char");
            obj.style.set_font("8 arial");
            this.div_sumInfo.addChild(obj.name, obj);

            obj = new Edit("p_cntCd", "absolute", "17.61%", "266", "50", "20", null, null, this);
            obj.set_taborder("117");
            obj.set_visible("false");
            obj.set_value("0");
            this.addChild(obj.name, obj);

            obj = new Button("btnOrderAdd", "absolute", null, "886", "84", "22", "45", null, this);
            obj.set_taborder("118");
            obj.set_text("주문서 저장");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btnOrderAdd00", "absolute", null, "886", "84", "22", "45", null, this);
            obj.set_taborder("119");
            obj.set_text("결제하기");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("p_seasonCd", "absolute", "23.02%", "266", null, "20", "68.27%", null, this);
            obj.set_taborder("120");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_installInfo", "absolute", null, "667", "703", "157", "-93", null, this);
            obj.set_taborder("121");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("true");
            this.addChild(obj.name, obj);
            obj = new Div("Div00", "absolute", "-82.94%", "253", null, "150", "149.85%", null, this.div_installInfo);
            obj.set_taborder("20");
            obj.set_text("Div00");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "72", "593", "31", null, null, this.div_installInfo);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "0", "72", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("22");
            obj.set_text("장착점명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "0", "121", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("23");
            obj.set_displaynulltext("장착대리점코드");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "46", "120", "21", null, null, this.div_installInfo);
            obj.set_taborder("24");
            obj.set_text("장착점정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "85", "77", "194", "21", null, null, this.div_installInfo);
            obj.set_taborder("25");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "386", "72", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("26");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Calendar("cal_procDay", "absolute", "471", "77", "116", "21", null, null, this.div_installInfo);
            this.div_installInfo.addChild(obj.name, obj);
            obj.set_taborder("27");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Edit("ed_salesOffice", "absolute", "218", "53", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("29");
            obj.set_displaynulltext("지점 코드");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroup", "absolute", "96", "53", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("30");
            obj.set_displaynulltext("지사 코드");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_posCd", "absolute", "0", "101", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("31");
            obj.set_displaynulltext("우편번호");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_city", "absolute", "122", "101", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("32");
            obj.set_displaynulltext("주소");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_street", "absolute", "246", "101", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("33");
            obj.set_displaynulltext("상세주소");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "370", "101", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("34");
            obj.set_displaynulltext("전화번호");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Button("btn_searchAgency", "absolute", "282", "77", "41", "21", null, null, this.div_installInfo);
            obj.set_taborder("35");
            obj.set_text("대리점");
            obj.getSetter("domainId").set("nexa.save");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Button("btn_visitSchd", "absolute", "329", "77", "53", "21", null, null, this.div_installInfo);
            obj.set_taborder("36");
            obj.set_text("방문일정");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.save");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("StaticVisit", "absolute", "386", "42", "207", "31", null, null, this.div_installInfo);
            obj.set_taborder("37");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_visitTel", "absolute", "470", "47", "115", "21", null, null, this.div_installInfo);
            obj.set_taborder("38");
            obj.set_maxlength("80");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_visitTel", "absolute", "386", "42", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("39");
            obj.set_text("방문연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_visitYn", "absolute", "494", "101", "73", "21", null, null, this.div_installInfo);
            obj.set_taborder("40");
            obj.set_displaynulltext("방문장착");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);

            obj = new Grid("Grid05", "absolute", "61.03%", "1392", null, "80", "10.03%", null, this);
            obj.set_taborder("122");
            obj.set_binddataset("ds_rtsd0401");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"ordNo\"/><Cell col=\"1\" disptype=\"normal\" text=\"agencyCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"reqDay\"/><Cell col=\"3\" disptype=\"normal\" text=\"procDay\"/><Cell col=\"4\" disptype=\"normal\" text=\"procTm\"/><Cell col=\"5\" disptype=\"normal\" text=\"mobNo\"/><Cell col=\"6\" disptype=\"normal\" text=\"bldMngNo\"/><Cell col=\"7\" disptype=\"normal\" text=\"posCd\"/><Cell col=\"8\" disptype=\"normal\" text=\"addr1\"/><Cell col=\"9\" disptype=\"normal\" text=\"addr2\"/><Cell col=\"10\" disptype=\"normal\" text=\"statCd\"/><Cell col=\"11\" disptype=\"normal\" text=\"memo\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:ordNo\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:agencyCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:reqDay\"/><Cell col=\"3\" disptype=\"normal\" text=\"bind:procDay\"/><Cell col=\"4\" disptype=\"normal\" text=\"bind:procTm\"/><Cell col=\"5\" disptype=\"normal\" text=\"bind:mobNo\"/><Cell col=\"6\" disptype=\"normal\" text=\"bind:bldMngNo\"/><Cell col=\"7\" disptype=\"normal\" text=\"bind:posCd\"/><Cell col=\"8\" disptype=\"normal\" text=\"bind:addr1\"/><Cell col=\"9\" disptype=\"normal\" text=\"bind:addr2\"/><Cell col=\"10\" disptype=\"normal\" text=\"bind:statCd\"/><Cell col=\"11\" disptype=\"normal\" text=\"bind:memo\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_svrCd", "absolute", "0", "713", null, "200", "54.23%", null, this);
            obj.set_taborder("123");
            obj.set_binddataset("ds_rtsd0013");
            obj.set_scrollbars("autoboth");
            obj.set_autoupdatetype("comboselect");
            obj.set_cellsizingtype("col");
            obj.set_cellclickbound("cell");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"144\"/><Column size=\"50\"/><Column size=\"65\"/><Column size=\"85\"/><Column size=\"75\"/><Column size=\"88\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"상세서비스\"/><Cell col=\"1\" text=\"기간\"/><Cell col=\"2\" text=\"타이어본수\"/><Cell col=\"3\" text=\"서비스횟수\"/><Cell col=\"4\" text=\"금액\"/><Cell col=\"5\" text=\"할인액\"/></Band><Band id=\"body\"><Cell text=\"bind:prsNm\"/><Cell col=\"1\" text=\"bind:periodNm\"/><Cell col=\"2\" text=\"bind:cntNm\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:servCnt\" combodataset=\"ds_svrCnt\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" text=\"bind:servAmtSum\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" text=\"bind:saleAmt\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 549, 107, this.div_custInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");

            	}
            );
            this.div_custInfo.addLayout(obj.name, obj);

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
            obj = new Layout("default", "", 422, 140, this.div_carInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("114");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");

            	}
            );
            this.div_carInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 680, 120, this.div_sumInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("115");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");

            	}
            );
            this.div_sumInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 703, 157, this.div_installInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("121");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enable("true");

            	}
            );
            this.div_installInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 1388, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDOrderRegister");
            		p.set_scrollbars("autoboth");
            		p.set_titletext("일시불 주문등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item66","div_installInfo.ed_visitTel","value","ds_rtsd0401","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","div_custInfo.cb_custTp","value","ds_rtsd0100","custTp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","ed_orderNo","value","ds_rtsd0104","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item65","ed_SaleCd","value","ds_rtsd0104","saleCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_custInfo.ed_custNm","value","ds_rtsd0100","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_custInfo.ed_birthDay","value","ds_rtsd0100","birthDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_custInfo.ed_mobNo","value","ds_rtsd0100","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_carInfo.cb_makerCd","value","ds_rtsd0104","makerCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_carInfo.ed_model","value","ds_rtsd0104","modelCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_carInfo.ed_carNo","value","ds_rtsd0104","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_custInfo.ed_buslNo","value","ds_rtsd0100","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","div_custInfo.ed_custNo","value","ds_rtsd0100","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_custInfo.ed_repNm","value","ds_rtsd0100","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_carInfo.ed_frCd","value","ds_rtsd0104","frCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_installInfo.ed_agencyNm","value","ds_rtsd0104","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_installInfo.cal_procDay","value","ds_rtsd0104","procDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","div_installInfo.ed_agencyCd","value","ds_rtsd0104","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","div_installInfo.ed_salesGroup","value","ds_rtsd0104","salesGroup");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","div_installInfo.ed_salesOffice","value","ds_rtsd0104","salesOffice");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_custTp2","div_custInfo.cb_custTp2","value","ds_cust","custTp2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_taxYn","div_custInfo.ed_taxYn","value","ds_cust","taxYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_carInfo.ed_contentsCd","value","ds_rtsd0104","contentsCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","ed_SaleProdNm","value","ds_rtsd0104","saleNm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDDirectOrder.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDDirectOrder.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDDirectOrder.xfdl
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
        this.p_arg 			= "RTSDDirectOrder";
        this.resultOrdNo 	= "0";
        this.p_modelCd  	= "";
        this.p_makerCd 		= "";
        this.p_contentsCd 	= "";
        this.p_frCd 		= "";
        this.toDay 			= "";   //현재날짜
        this.addDay			= "";	//현재날짜+3
        this.checkbuslNo 		= "";
        this.userGrp 		= application.gds_userInfo.getColumn(0,"userGrp");	//사용자 그룹 		--> *01:영업관리자, *02:콜센터, *03:지사, *04:지점, *05:대리점, *13:콜센터(아웃바운드)
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //공통 fn_callBack START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if (strSvcId == "initRTSDDirectOrder"){
        	}	
        		if(strSvcId == "listRtsd0104"){
        			if(nvl(this.ds_rtsd0104.getColumn(0,"ordNo").substring(0,1)) != 'L') {
        				alert("일시불주문등록은 일시불 상품만 볼수있습니다.");
        				this.FN_initializationDataSet();
        				return;
        			}
        		/*this.btnOrderAdd.set_enable(true);*/

        		trace("aaa");
        		
        		var rtsd0104Cnt = this.ds_rtsd0104.getRowCount();
        		if( rtsd0104Cnt != 0 ){
        			this.p_makerCd 		= nvl(this.ds_rtsd0104.getColumn(0,"makerCd"));
        			this.p_modelCd 		= nvl(this.ds_rtsd0104.getColumn(0,"modelCd"));
        			this.p_contentsCd 	= nvl(this.ds_rtsd0104.getColumn(0,"contentsCd"));
        			this.p_frCd 		= nvl(this.ds_rtsd0104.getColumn(0,"frCd"));
        			
        			this.div_carInfo_cb_makerCd_onitemchanged();

        			/*this.periodCd = nvl(this.ds_rtsd0104.getColumn(0,"periodCd"));*/
        			this.p_periodCd.set_value(this.ds_rtsd0104.getColumn(0,"periodCd"));
        			
        		
        			//판매상품조회 2018.10.25 추가
        			/*this.ed_SaleProdNm.set_value(nvl(this.ds_rtsd0104.getColumn(0,"saleNm")));	*/
        			//this.FN_listRtsd0106();
        			trace(nvl(this.ds_rtsd0104.getColumn(0,"ordNo")));
        			if(nvl(this.ds_rtsd0104.getColumn(0,"ordNo")) != "") {
        				this.fn_SalePrdtSearch();	// 계약별 판매상품 불러오기
        				this.fn_searchProduct(); 	// 계약별 제품정보 불러오기
        				this.fn_searchAdtProduct(); // 계약별 부가상품 불러오기
        				this.fn_searchPrmmSrvc(); 	// 계약별 프리미엄 서비스  불러오기	
        			}
        			//판매상품관련 버튼 활성, 비활성 처리
        		if(nvl(this.ds_rtsd0104.getColumn(0,"statCd"))=="00"){
        			this.buttoncontrol(this.ds_rtsd0104.getColumn(0,"statCd"));			
        		}
        		if(nvl(this.ds_rtsd0104.getColumn(0,"statCd"))=="01"){
        			this.buttoncontrol(this.ds_rtsd0104.getColumn(0,"statCd"));
        		}
        			if(nvl(this.ds_rtsd0104.getColumn(0,"saleCd")) != "") {
        				this.btn_SalePrdtSearch.set_enable(false);				
        				this.div_custInfo.set_enable(false);
        				
        				//-----2+2 미허용
        					if(this.ds_productInfo.getRowCount() < 1){ 					//-----2+2 미허용
        						this.btnAddPrdt.set_enable(false);
        					}else{
        						this.btnAddPrdt.set_enable(true);				
        					}
        					
        				//-----2+2 허용
        				//this.btnAddPrdt.set_enable(true);				
        				
        				this.btnAddPrdtDel.set_enable(true);
        				this.btnValuePrdtAdd.set_enable(true);
        				this.btnValuePrdtDel.set_enable(true);
        				this.btnOrderAdd.set_enable(true);
        			} else {
        				this.btn_SalePrdtSearch.set_enable(true);				
        				this.div_custInfo.set_enable(true);
        				this.btnAddPrdt.set_enable(false);
        				this.btnAddPrdtDel.set_enable(false);
        				this.btnValuePrdtAdd.set_enable(false);
        				this.btnValuePrdtDel.set_enable(false);
        				this.btnOrderAdd.set_enable(true);

        			}
        			
        		}else{
        			alert("계약조회 :계약정보가 없습니다.");
        		}
        		var rtsd0100Cnt = this.ds_rtsd0100.getRowCount();
        		if( rtsd0100Cnt != 0 ){
        			this.div_custInfo_cb_custTp_onitemchanged();
        			this.div_custInfo.cb_custTp.set_value(this.ds_rtsd0100.getColumn(0,"custTp"));
        		}else{
        			alert("계약조회 : 고객정보가 없습니다.");
        		}
        		this.contactRowChg();		
        	}	
        	
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "selectFirstDay"){
        		
        	}
        	if(strSvcId == "saveDirectOrder2"){	
        		this.ed_orderNo.set_value(this.resultOrdNo);
        			if( confirm( strErrorMsg +"\n 계약번호는 \'"+this.resultOrdNo+"\' 입니다." + "\n저장된 계약번호로 조회하시겠습니까?") ){
        				this.FN_listRtsd0104( this.resultOrdNo );
        			}else{
        				this.FN_listRtsd0104( this.resultOrdNo );
        				this.reload();
        			}
        	}		
        	
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        		
        	if(strSvcId == "listRtsd0106"){
        		var prdInfoCnt = this.ds_productInfo.getRowCount(); // 제품정보
        		if( prdInfoCnt == 0 ){
        			this.alert("계약조회 : 제품정보가 없습니다.");
        		}
        	}

        	// 차량별 상세정보 조회
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
        		this.btn_SalePrdtSearch.set_enable(true);
        	}
        	
        	
        	if(strSvcId == "saleItemList") 
        	{
        		this.ed_SaleProdNm.set_value(nvl(this.ds_saleItemList.getColumn(0,"saleNm")));
        		
        		this.contactRowChg();
        		
        	}
        	

        	if(strSvcId == "listAddSelProduct") {
        		if(nvl(this.p_periodCd.value) == ''){
        			this.p_periodCd.set_value(this.ds_productInfo.getColumn(0,"periodCd") ); // 처음 등록일 경우
        		}
        		this.p_cntCd.set_value(this.getTotCntCd());
        		this.contactRowChg();
        	}
        	
        	if(strSvcId == "srvcOrdList"){
        		// 무제한 선택여부 
        		if(nvl(this.ds_rtsd0013.getColumn(0, "servInfYN")) != 'Y'){
        			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "displaytype", "normal");
        			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "edittype", "none");
        		}else{
        // 			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "displaytype", "combo");
        // 			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "edittype", "combo");
        		}
        		this.contactRowChg();	
        	}

        	
        	if(strSvcId == "saveDirectOrder"){
        		if(nErrorCode == "-2"){
        			alert(strErrorMsg);
        		}else if( nErrorCode == "0" && this.resultOrdNo != "0" ){
        			this.ed_orderNo.set_value(this.resultOrdNo);
        			if( confirm( strErrorMsg +"\n저장된 계약번호는 \'"+this.resultOrdNo+"\' 입니다." + "\n저장된 계약번호로 조회하시겠습니까?") ){
        				this.FN_listRtsd0104( this.resultOrdNo );
        				
        				this.btnOrderAdd00.set_visible(true);
        				this.btnOrderAdd.set_visible(false);
        				
        			}else{
        				this.FN_listRtsd0104( this.resultOrdNo );
        				this.reload();
        			}
        		}else{
        			alert(strErrorMsg);
        		}
        	
        	}
        	
        	if(strSvcId == "getToday"){
        	/*this.div_installInfo.cal_procDay.set_value(this.toDay);*/
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
        	
        	//계약별 프리미엄서비스
        		if(strSvcId == "prmmSrvcOrdList"){
        		//this.alert(this.ds_rtsd0013.getColumn(0, "servInfYN"));
        		// 무제한 선택여부 
        		if(nvl(this.ds_rtsd0013.getColumn(0, "servInfYN")) != 'Y'){
        			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "displaytype", "normal");
        			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "edittype", "none");
        		}else{
        // 			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "displaytype", "combo");
        // 			this.grid_svrCd.setCellProperty("body", this.grid_svrCd.getBindCellIndex("body", "servCnt"), "edittype", "combo");
        		}
        		this.contactRowChg();
        	
        	}
        	
        	if( strSvcId == "checkBuslNo" ){
        		if( this.resultBuslCnt != "0"){
        			alert("입력하신 " + this.div_custInfo.st_buslNo.text  + " \'"+ this.checkbuslNo + "\' 는 존재하고 있습니다.");
        			this.div_custInfo.ed_buslNo.set_value("");
        			return this.div_custInfo.ed_buslNo.setFocus(true);
        		}else{
        			var buslNo = nvl(this.div_custInfo.ed_buslNo.value);
        			var intBuslNo = parseInt(buslNo.substring(3,5));		//사업자번호 4,5번째 자리
        			if( buslNo.length != 10){
        				alert( this.div_custInfo.st_buslNo.text + " 를 확인하세요." );
        			}else{
        				if( (1 <= intBuslNo && intBuslNo <= 79) || (intBuslNo == 80) || (89 <= intBuslNo && intBuslNo <= 99) ){
        					this.div_custInfo.cb_custTp2.set_value("0002");		//고객분류 : 개인사업자
        					if( (89 <= intBuslNo && intBuslNo <= 99) || (intBuslNo == 80) ){
        						this.div_custInfo.ed_taxYn.set_value("N");		//개인사업자 면세여부
        					}else{
        						this.div_custInfo.ed_taxYn.set_value("Y");		//개인사업자 면세여부
        					}
        				}else if( (intBuslNo == 83) || (intBuslNo == 82)){
        					this.div_custInfo.ed_taxYn.set_value("N");			//개인사업자 면세여부
        					this.div_custInfo.cb_custTp2.set_value("0003");		//고객분류 : 관공서
        				}else if( (intBuslNo == 81) || (intBuslNo == 84) || (intBuslNo == 85) || (intBuslNo == 86) || (intBuslNo == 87) || (intBuslNo == 88) ){
        					this.div_custInfo.ed_taxYn.set_value("N");			//개인사업자 면세여부
        					this.div_custInfo.cb_custTp2.set_value("0004");		//고객분류 : 법인
        				}else{
        					this.div_custInfo.ed_taxYn.set_value("N");			//개인사업자 면세여부
        					this.div_custInfo.cb_custTp2.set_value("0005");		//고객분류 : 기타
        				}
        			}
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
        this.RTSDDirectOrder_onload = function(obj,e){
        //FORM ONLOAD FUNCTION
        	Ex.core.init(obj);
        	
        	this.ds_rtsd0100.addRow();
        	this.ds_rtsd0104.addRow();
        	this.fn_init();	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //UserFunction : 상품-가격정보 변경 및 SELECT BOX DATA SELECT
        this.fn_init = function(){
        	
        	this.fn_getToday();
        	this.fn_initBtn();		//Button
        	var sSvcID      	= "initRTSDDirectOrder";  
        	var sController   	= "rtms/sd/initRTSDContractRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_custTp=mapDsCustTp ";
        	sOutDatasets += " ds_maker=mapDsMaker ";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	this.btn_SalePrdtSearch.set_enable(false);
        	this.btnAddPrdt.set_enable(false);
        	this.btnAddPrdtDel.set_enable(false);
        	this.btnValuePrdtAdd.set_enable(false);
        	this.btnValuePrdtDel.set_enable(false);
        	this.div_installInfo.btn_searchAgency.set_enable(false);
        	this.div_installInfo.cal_procDay.set_enable(false);
        	this.btnOrderAdd.set_enable(false);
        	this.btnOrderAdd00.set_visible(false);
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initBtn  = function() {
        	/* 
        	  1. S : 조회
        	  2. C : 저장
        	  3. N : 추가
        	  4. DL: 삭제
        	  5. E : 엑셀
        	  기타: workFrame.xfdl참조
        	*/	
        	this.parent.setButton("", this);
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
        //고객정보 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //BUTTON EVENT
        this.div_custInfo_btn_custNoSearch_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg,p_custNm:this.div_custInfo.ed_custNm.value,p_birthDay:this.div_custInfo.ed_birthDay.value,p_mobNo:this.div_custInfo.ed_mobNo.value,p_formId :this.p_arg};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }

        this.returnCustInfo = function(ds){

        	if(ds[0].rowcount > 0){
         		
         		this.ds_rtsd0100.copyData(ds[0]);
         		
         		//var contactRow = this.ds_rtsd0104.addRow();
         
         		this.div_custInfo.ed_custNo.set_value(this.ds_rtsd0100.getColumn(0,"custNo"));
        		this.fn_initSetValue();
         	/*	this.div_installInfo.cal_procDay.set_value( this.toDay );*/
         		if(this.ds_rtsd0100.getColumn(0,"custTp")==01){
         		this.div_custInfo.ed_custNm.set_value(this.ds_rtsd0100.getColumn(0,"custNm"));
         		this.div_custInfo.ed_birthDay.set_value(this.ds_rtsd0100.getColumn(0,"birthDay"));
         		this.div_custInfo.ed_mobNo.set_value(this.ds_rtsd0100.getColumn(0,"mobNo"));
         		this.FN_cust01();
         		}
         		else if(this.ds_rtsd0100.getColumn(0,"custTp")==02){
         		this.div_custInfo.ed_repNm.set_value(this.ds_rtsd0100.getColumn(0,"repNm"));
         		this.div_custInfo.ed_buslNo.set_value(this.ds_rtsd0100.getColumn(0,"buslNo"));
         		this.div_custInfo.ed_mobNo.set_value(this.ds_rtsd0100.getColumn(0,"mobNo"));
         		this.div_custInfo.ed_repNm.set_enable(false);
        		this.div_custInfo.ed_buslNo.set_enable(false);
        		this.div_custInfo.ed_mobNo.set_enable(false);
         		this.FN_cust02();
         		}
         				
         		var regId   = nvl( ds[0].getColumn(0,"regId")  );
         		var custTp  = nvl( ds[0].getColumn(0,"custTp") );
         		if( this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ){//B2B
         			this.FN_divChangeTrue();
         		}
         	}
         	this.div_custInfo.set_enable(false);
        	this.btn_SalePrdtSearch.set_enable(true);

        }

        this.fn_initSetValue = function(){
        	this.div_installInfo.cal_procDay.set_value(this.toDay);
        		
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
        //BUTTON EVENT
        this.btn_orderNoSearch_onclick = function(obj,e){
        	var ordId = "03";
        	var args ={ p_arg : this.p_arg ,"ordId" : ordId};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMLumpSum_pop.xfdl",args, "modaless=false");
        }
        this.returnOrderNoInfo = function(ordNo){

        	this.FN_listRtsd0104(ordNo);
        	
        	if( this.userGrp == "05" ){
        		this.div_installInfo.btn_searchAgency.set_visible(false);
        		this.div_installInfo.ed_agencyNm.set_width(370);		
        	}else{
        		this.div_installInfo.btn_searchAgency.set_visible(true);
        		this.div_installInfo.ed_agencyNm.set_width(320);
        	}	
        }

        

        

        
        this.div_custInfo_ed_buslNo_onchanged = function(obj,e)
        {
        	var checkBuslNo = FN_buslNoCheck( nvl(this.div_custInfo.ed_buslNo.value) )//comLib 사업자번호체크
        	if( !checkBuslNo ){
        		alert("사업자번호를 다시 확인 해 주세요.");
        		this.div_custInfo.ch_birthDayAndBuslNoCh.set_value("false");
        		return false;
        	}else{
        		this.div_custInfo.ch_birthDayAndBuslNoCh.set_value("true");
        	}
        	
        	var sSvcID        	= "checkBuslNo";
        	var sController   	= "rtms/sd/checkBuslNo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("buslNo", nvl(this.div_custInfo.ed_buslNo.value));
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_custInfo_ed_birthDay_onsetfocus = function(obj,e){
        	obj.setSelect(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.div_custInfo_ed_birthDay_onchanged = function(obj,e)
        {
        	if( !FN_birthDayCheck( this.div_custInfo.ed_birthDay.value ) ){

        		this.div_custInfo.ed_birthDay.setFocus(true);
        		this.div_custInfo.ch_birthDayAndBuslNoCh.set_value("false");
        		this.div_custInfo.ed_birthDay.set_value("");
        		return false;
        	}else{

        		this.div_custInfo.ch_birthDayAndBuslNoCh.set_value("true");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_custInfo_ed_buslNo_onsetfocus = function(obj,e){
        	obj.setSelect(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_custInfo_ed_mobNo_onsetfocus = function(obj,e){
        	obj.setSelect(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        
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
        	sArgs += Ex.util.setParam("ordId", "03");
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);		
        }

        
        this.FN_initializationDataSet = function(){
        	this.ds_rtsd0100.clearData();
        	this.ds_rtsd0110.clearData();
        	this.ds_rtsd0111.clearData();
        	this.ds_rtsd0104.clearData();

        	this.ds_rtre0010.clearData();
        	this.ds_rtre0020.clearData();
        	this.ds_rtsd0013.clearData();
        	
        	
        	this.div_carInfo.cb_model.set_index(-1);

        }
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
        	
        	//-----2+2미허용
        	if(this.ds_productInfo.getRowCount() < 1){ 					
        		this.btnAddPrdt.set_enable(true);
        		this.btnAddPrdtDel.set_enable(true);
        	}
        	this.FN_priceDeleteAll();
        	
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //EDIT FUNCTION : 차량번호 변경
        this.div_carInfo_ed_carNo_onchanged = function(obj,e){

        	if(this.carNoCheck()){
        	}
        	this.FN_priceDeleteAll();
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
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
        this.FN_priceDeleteAll = function(){
        	this.ds_rtsd0013.clearData();
        /*	this.ds_rtsd0014.clearData();*/
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //DATASET FUNCTION : ROWPOSITION이 변경되었을때
        this.ds_model_onrowposchanged = function(obj,e){
        	this.div_carInfo.ed_model.set_value( this.ds_model.getColumn(this.ds_model.rowposition,"modelCd") );
        	this.div_carInfo.ed_contentsCd.set_value( this.ds_model.getColumn(this.ds_model.rowposition,"contentsCd") ); // 2018.12.20 추가수정
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //EDIT FUNCTION : 차량번호 -> ENTER KEY -> 현재주행거리로 FOUCS이동
        this.div_carInfo_ed_carNo_onkeyup = function(obj,e){
        	if ( e.keycode == 13 ){
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
        //판매상품조회 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.btn_SalePrdtSearch_onclick = function(obj,e)
        {
        	if(nvl(this.div_custInfo.ed_mobNo.value)==""){
        		alert( this.div_custInfo.st_mobNo.text + " 값이 없습니다." );
        		this.div_custInfo.ed_mobNo.setFocus(true);
        		return false;	
        	}
        	
        	if(nvl(this.div_custInfo.cb_custTp.value)==""){
        		alert( this.div_custInfo.st_custTp.text + " 값이 없습니다." );
        		this.div_custInfo.cb_custTp.setFocus(true);
        		return false;	
        	}
        	
        	if(nvl(this.div_carInfo.ed_carNo.value)==""){
        		alert( this.div_carInfo.st_carNo.text + " 값이 없습니다." );
        		this.div_carInfo.ed_carNo.setFocus(true);
        		return false;
        	}	
        	
        	var args = {p_formId:this.p_arg,p_prdtGrp:"03"}; 
        	Ex.core.popup(this,"판매상품조회","comm::RTCOMMSellProduct_pop.xfdl",args, "modaless=false");
        }

        this._setSaleReturn = function(arg) {
        	var saleCd = nvl(arg[0]);
        	
        	this.ed_SaleCd.set_value(saleCd);		
        		
        		this.div_custInfo.set_enable(false);
        		this.p_periodCd.set_value();
        		this.p_cntCd.set_value(0);
        		this.p_seasonCd.set_value();
        		this.ds_ValuePrdtInfo.clearData();
        		this.ds_rtsd0013.clearData();
        		this.div_sumInfo.ed_DcPrice.set_value(0);
        		this.div_sumInfo.ed_SumtotalPrice.set_value(0);
        		this.div_sumInfo.ed_totalPrice.set_value(0);
        		this.ds_productInfo.clearData();		
        		this.btnValuePrdtAdd.set_enable(false);
        		this.btnValuePrdtDel.set_enable(false);	
        				
        		this.btnAddPrdt.set_enable(true);			//-----------------2+2미허용
        		
        	this.fn_SalePrdtSearch(saleCd); //판매상품조회
        }
        this.fn_SalePrdtSearch = function(saleCd)
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

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //판매상품조회 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        //제품추가 팝업 버튼
        this.btnAddPrdt_onclick = function(obj,e)
        {
        	//판매상품을 클릭하지않고 제품추가를 클릭할시
         	if(nvl(this.ed_SaleCd.value) == ""){
         		alert("판매상품명이 존재하지 않습니다.");
         		return false;
         	}
        	var idx 		= this.ds_model.rowposition;
        	var modelCd 	= nvl(this.div_carInfo.ed_model.value);
        	var makerTxt	= nvl(this.div_carInfo.cb_makerCd.text );
        	var modelTxt 	= nvl(this.div_carInfo.cb_model.text );
        	var contentsCd 	= nvl(this.div_carInfo.ed_contentsCd.value); // 2018.12.20 추가수정

        	var saleCd = "";
        	
        	if(nvl(this.ed_SaleCd.value,"") == "") {
        		saleCd = this.ed_SaleCd.set_value(nvl(this.ds_saleItemList.getColumn(0,"saleCd")));
        	} else {
        		saleCd = this.ed_SaleCd.value;
        	}
        	var periodCd 	= nvl(this.p_periodCd.value );
        	var frCd 		= nvl(this.div_carInfo.ed_frCd.value );
        	var cntCd		= nvl(parseInt(this.p_cntCd.value));
        	var seasonCd	= nvl(this.p_seasonCd.value );
        	
        	var args ={p_formId : "RTSDDirectOrder",
        						 "p_modelCd" : modelCd,
        						 "p_contentsCd" : contentsCd,
        						 "p_makerTxt" : makerTxt,
        						 "p_modelTxt" : modelTxt,
        						 "p_periodCd" : periodCd,
        						 "p_saleCd" : saleCd,
        						 "p_frCd" : frCd,
        						 "p_cntCd" : cntCd,
        						 "p_seasonCd" : seasonCd};

        	Ex.core.popup(this,"제품추가","sd::RTSDAddProduct_pop.xfdl",args, "modaless=false");
        }

        this._setReturn = function(arr) {
        	var rowCnt = arr[0].rowcount;
        	var arrList = new Array();
        	
        	var regiSum	= 0;
        	var rentSum = 0;

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
        					this.ds_productInfo.setColumn(nRow,"ordId","03");
        					this.ds_productInfo.setColumn(nRow,"periodCd",periodCd);
        					//최초 등록일 경우
        					if(nvl(this.p_periodCd.value,"") == "") {
        						this.p_periodCd.set_value(periodCd);
        					}
        					this.ds_productInfo.setColumn(nRow,"cntCd",cntCd);
        					this.ds_productInfo.setColumn(nRow,"frCd",frCd);
        					this.ds_productInfo.setColumn(nRow,"frNm",frNm);
        					this.ds_productInfo.setColumn(nRow,"lrCd","");
        					this.ds_productInfo.setColumn(nRow,"matCd",matCd);
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
        					
        					if(nvl(this.ds_rtsd0104.getColumn(0, "statCd")) == '') {
        						this.ds_productInfo.setColumn(nRow,"statCd", "01");
        					} else {
        						this.ds_productInfo.setColumn(nRow,"statCd", nvl(this.ds_rtsd0104.getColumn(0, "statCd")));
        					}
        					
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
        						this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(groupSale));
        						this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(groupSale));
        					} else {
        						this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(chnlSale));
        						this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(chnlSale));
        					}
        					
        					//this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        					this.ds_productInfo.setColumn(nRow,"monAmt",nvl(rentAmt));
        					
        					
        					//등록비 관련 데이타 조회(2018.10.30)
        					//this.FN_saleRegiAmt();
        					this.p_cntCd.set_value(this.getTotCntCd()); // 선택한 타이어 본수 합
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
        			this.ds_productInfo.setColumn(nRow,"ordId","03");
        			this.ds_productInfo.setColumn(nRow,"periodCd",periodCd);
        			this.ds_productInfo.setColumn(nRow,"cntCd",cntCd);
        			this.ds_productInfo.setColumn(nRow,"frCd",frCd);
        			this.ds_productInfo.setColumn(nRow,"frNm",frNm);
        			
        			this.ds_productInfo.setColumn(nRow,"lrCd","");
        			this.ds_productInfo.setColumn(nRow,"matCd",matCd);
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
        			
        			if(nvl(this.ds_rtsd0104.getColumn(0, "statCd")) == '') {
        				this.ds_productInfo.setColumn(nRow,"statCd", "01");
        			} else {
        				this.ds_productInfo.setColumn(nRow,"statCd", nvl(this.ds_rtsd0104.getColumn(0, "statCd")));
        			}
        					
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
        				this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(groupSale));
        				this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(groupSale));
        			} else {
        				this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(chnlSale));
        				this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(chnlSale));
        			}
        			
        			//this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        			this.ds_productInfo.setColumn(nRow,"monAmt",nvl(rentAmt));
        			
        					
        			this.p_periodCd.set_value(periodCd);
        			this.p_seasonCd.set_value(seasonCd);
        			/*
        			this.ds_productInfo.setColumn(nRow,"reRentalSaleAmt",reRentalSaleAmt);
        			this.ds_productInfo.setColumn(nRow,"employeeSaleAmt",employeeSaleAmt);
        			*/

        			
        			//등록비 관련 데이타 조회(2018.10.30)
        			//this.FN_saleRegiAmt();
        			this.p_cntCd.set_value(this.getTotCntCd()); // 선택한 타이어 본수 합
        			this.p_periodCd.set_value(periodCd);
        			this.contactRowChg();
        		}
        		this.btnAddPrdt.set_enable(false);			//-----------------2+2미허용
        	}
        	
        	//부가제품등록, 삭제 버튼 활성화
        	this.btnValuePrdtAdd.set_enable(true);
        	this.btnValuePrdtDel.set_enable(true);
        	//장착 대리점 버튼 활성화
        	this.div_installInfo.btn_searchAgency.set_enable(true);
        	if( this.userGrp == "05" ){
        	this.div_installInfo.cal_procDay.set_enable(false);
        	}else{
        	this.div_installInfo.cal_procDay.set_enable(true);
        	}
        	this.fn_getPrmmSrvc();
        	//주문서 저장 버튼제어
        	this.btnOrderAdd.set_enable(true);
        }

        

        //제품정보 삭제
        this.btnAddPrdtDel_onclick = function(obj,e)
        {
        	var cnt = 0;
        	var dsObj = this.ds_productInfo;
        	for(var i=0;i<dsObj.getRowCount();i++){
        	var iRowType = dsObj.getRowType(i);
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        		cnt++;
        		}
        	}
        	if(cnt!=0){
        		var arry = [];
        		var parry = [];
        		
        		for (var i=0; i<dsObj.getRowCount(); i++) {
        			if(dsObj.getColumn(i, "chk") == 1){
        				arry[i] = i;
        				parry[i] = dsObj.getColumn(i, "matCd")+dsObj.getColumn(i, "periodNm").replace(/[^0-9]/g, '')+dsObj.getColumn(i, "cntCd").replace(/[^0-9]/g, '');
        			}
        		}
        		dsObj.deleteMultiRows(arry);
        	
        	if(dsObj.getRowCount()==0){
        		this.p_periodCd.set_value();
        		this.p_cntCd.set_value(0);
        		this.p_seasonCd.set_value();
        		this.ds_ValuePrdtInfo.clearData();
        		this.ds_rtsd0013.clearData();
        		this.div_sumInfo.ed_DcPrice.set_value(0);
        		this.div_sumInfo.ed_SumtotalPrice.set_value(0);
        		this.div_sumInfo.ed_totalPrice.set_value(0);
        		this.btnOrderAdd.set_enable(false);			//주문서 저장 버튼제어
        		this.btnAddPrdt.set_enable(true);			//-----------------2+2미허용
        	}	
        	this.p_cntCd.set_value(this.getTotCntCd());
        	//등록비 관련 데이타 조회(2018.10.30)
        	//this.FN_saleRegiAmt();
        	this.fn_getPrmmSrvc();
        	this.contactRowChg();
        	}else{
        		alert("변경된 데이터가 없습니다!");
        		return false; 
        	}
        }

        // 타이어본수 계산
        this.getTotCntCd = function(){

        	var totTotCntCd = 0;
        	for(var i=0; i< this.ds_productInfo.rowcount; i++){
        		if(this.ds_productInfo.getColumn(i, "cntCd") !== undefined && this.ds_productInfo.getColumn(i, "cntCd") != "" ){
        			totTotCntCd += parseInt(this.ds_productInfo.getColumn(i, "cntCd"));
        		}	
        	}
        // 	if(totTotCntCd<10){
        // 		totTotCntCd ="0"+totTotCntCd;
        // 	}
        	return totTotCntCd;
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

        			//등록비 관련 데이타 조회(2018.10.30)
        			this.contactRowChg();
        		}
        	}
        }

        //부가제품 삭제
        this.btnValuePrdtDel_onclick = function(obj,e)
        {
        	var dsObj = this.ds_ValuePrdtInfo;	
        /*    var dsPObj = this.ds_contactDeliInfo;*/	
        	var arry = [];
        	var parry = [];
        	
        	for (var i=0; i<dsObj.getRowCount(); i++) {
        		if(dsObj.getColumn(i, "chk") == 1){	
        			arry[i] = i;
        			parry[i] = dsObj.getColumn(i, "addGdsCd");
        		}
        	}
        	dsObj.deleteMultiRows(arry);
        	
        	
        	//등록비 관련 데이타 조회(2018.10.30)
        	//this.FN_saleRegiAmt();
        	this.contactRowChg();
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //장착점정보 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_installInfo_btn_searchAgency_onclick = function(obj,e){
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
        	// 20181224 방문장착관련 시작
        	this.div_installInfo.ed_visitYn.set_value(arr[8]);
        	
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

        	this.div_installInfo.cal_procDay.set_value( this.addDay );
        	/*this.btnOrderAdd.set_enable(true);*/
        	
        	this.div_installInfo.cal_procDay.setFocus(true);
        }

        // 20181224 방문장착관련 시작
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
        // 20181224 방문장착관련 끝

        
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
        this.contactRowChg = function()
        {	
        	var sPeriod			= 0;
        	if(nvl(this.p_periodCd.value) == '') {
        		sPeriod = 0;
        	} else {
        		sPeriod = this.p_periodCd.value;
        	}
        		if( sPeriod > 0) {

        		var regiAmt = 0;	//등록비
        		var rentAmt = 0;	//월렌탈료
        		var etcAmt = 0;		//부가제품금액
        		var etcDcAmt = 0;		//부가제품할인액
        		var dcAmt = 0;	//판매채널
        		var prmmAmt = 0;		//프리미엄금액
        		var prmmDcAmt = 0;		//프리미엄할인
        		
        		var totalSumAmt = 0;	//총합계금액
        		var totalDcAmt = 0;	//총할인금액
        		var payAmt = 0;		//총납부금액
        		if(this.ds_productInfo.rowcount > 0) {
        			for(var i=0; i < this.ds_productInfo.getRowCount(); i++) {
        			//등록비
        				if(nvl(this.ds_productInfo.getColumn(i, "regiAmt"),0) == 0) {
        					regiAmt = parseInt(regiAmt) + 0; 				
        				} else {
        					regiAmt = parseInt(regiAmt)+ parseInt(this.ds_productInfo.getColumn(i,"regiAmt"));
        				}
        				//월렌탈료
        				if(nvl(this.ds_productInfo.getColumn(i, "rentAmt"),0) == 0) {
        					rentAmt = parseInt(rentAmt) + 0; 				
        				} else {
        					rentAmt = parseInt(rentAmt)+ (parseInt(this.ds_productInfo.getColumn(i,"rentAmt"))*parseInt(this.ds_productInfo.getColumn(i,"periodCd")));
        				}
        				//판매채널할인
        				if(nvl(this.ds_productInfo.getColumn(i, "chnlSale"),0) == 0) {
        					dcAmt = parseInt(dcAmt) + 0; 				
        				} else {
        					dcAmt = parseInt(dcAmt)+ (parseInt(this.ds_productInfo.getColumn(i,"chnlSale"))*parseInt(this.ds_productInfo.getColumn(i,"periodCd")));
        				}
        			}
         		}
         		if(this.ds_ValuePrdtInfo.rowcount >0 ){
        			for(var i=0;i<this.ds_ValuePrdtInfo.getRowCount();i++){
        				if(nvl(this.ds_ValuePrdtInfo.getColumn(i,"amt"),0) ==0){
        					etcAmt = parseInt(etcAmt) + 0; 		
        				}
        				else{
        					etcAmt = parseInt(etcAmt)+ parseInt(this.ds_ValuePrdtInfo.getColumn(i,"amt"));
        				}
        				if(nvl(this.ds_ValuePrdtInfo.getColumn(i,"dcAmt"),0) ==0){
        					etcDcAmt = parseInt(etcDcAmt) + 0; 		
        				}
        				else{
        					etcDcAmt = parseInt(etcDcAmt)+ parseInt(this.ds_ValuePrdtInfo.getColumn(i,"dcAmt"));
        				}
        			}
         		}

         		if(this.ds_rtsd0013.rowcount >0 ){
        			for(var i=0;i<this.ds_rtsd0013.getRowCount();i++){
        				if(nvl(this.ds_rtsd0013.getColumn(i,"servAmtSum"),0) ==0){
        					prmmAmt = parseInt(prmmAmt) + 0;
        				}
        				else{
        					prmmAmt = parseInt(prmmAmt)+ (parseInt(this.ds_rtsd0013.getColumn(i,"servAmtSum"))*parseInt(this.ds_rtsd0013.getColumn(i,"periodCd")));
        				}
        				
        				if(nvl(this.ds_rtsd0013.getColumn(i,"saleAmt"),0) ==0){
        					prmmDcAmt = parseInt(prmmDcAmt) + 0;
        				}
        				else{
        					prmmDcAmt = parseInt(prmmDcAmt)+ (parseInt(this.ds_rtsd0013.getColumn(i,"saleAmt"))*parseInt(this.ds_rtsd0013.getColumn(i,"periodCd")));
        				}
        				
        			}
         		}

        		totalSumAmt = parseInt(regiAmt) + parseInt(rentAmt)  + parseInt(etcAmt) + parseInt(prmmAmt);
        		totalDcAmt = parseInt(dcAmt) + parseInt(etcDcAmt) + parseInt(prmmDcAmt);
        		payAmt = parseInt(totalSumAmt) - parseInt(totalDcAmt);	

         		this.div_sumInfo.ed_totalPrice.set_value(nvl(this.addComma(this.mathFloor(totalSumAmt)))); //1
         		this.div_sumInfo.ed_DcPrice.set_value(nvl(this.addComma(this.mathFloor(totalDcAmt))));		//2
         		this.div_sumInfo.ed_SumtotalPrice.set_value(nvl(this.addComma(this.mathFloor(payAmt)))); //3
        	}		
        }

        
        //------------ 계약별 정보 조회 -------------------------------------------------------------------------------
        // 계약번호별 제품정보 조회
        this.fn_searchProduct = function(){
        	this.idx	= this.ds_model.rowposition;
        	var modelCd = nvl(this.div_carInfo.ed_model.value);
        	var ordNo = nvl(this.ed_orderNo.value);
        	var saleCd = nvl(this.ed_SaleCd.value);
        	var contentsCd = nvl(this.div_carInfo.ed_contentsCd.value); // 2018.12.20 추가수정
        	
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
        	var sOutDatasets  	= "ds_rtsd0013=prmmSrvcOrdList";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo",   this.ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        this.prmmSvrComboGet = function(obj,e)
        {
        	//this.alert(obj.getColumn(e.row, "servCnt"));
        	
        	if(obj.getColumn(e.row, "servCnt") == '999'){
        		obj.setColumn(e.row, "servAmtSum", obj.getColumn(e.row, "servInfAmt"));
        	}else{
        		obj.setColumn(e.row, "servAmtSum", obj.getColumn(e.row, "servAmtSumOrg"));
        	}
        	this.contactRowChg();
        	
        // 프리미엄서비스 서비스 회수 조정시 계약상품 납부정보 금액 변경 및 재 계산
        }
        this.prmmSvrComboSet = function(obj,e)
        {

        // 	if(e.col == 3) {		
        // 		this.ds_svrCnt.filter("cd == '999' || cd == " + this.ds_rtsd0013.getColumn(e.row,"servCnt"));
        // 	}

        	//무제한클릭시 무제한만 콤보박스에 노출되는것 수정
        	var pCd = nvl(this.ds_rtsd0013.getColumn(e.row, "servCntOrg"))=='999'?nvl(this.ds_rtsd0013.getColumn(e.row, "servCntTemp")):nvl(this.ds_rtsd0013.getColumn(e.row, "servCntOrg"));
        	if(e.col == 3) {
        		this.ds_svrCnt.filter("cd == '999' || cd == " + pCd);
        	}

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
        	var sOutDatasets  	= "ds_rtsd0013=srvcOrdListMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_rtsd0013.clearData();  // dataset clear 한다.
        	sArgs += Ex.util.setParam("p_saleCd", saleCd);		// 판매코드
        	sArgs += Ex.util.setParam("p_periodCd", periodCd);	// 장착개월수
        	sArgs += Ex.util.setParam("p_cntCd", cntCd);		// 타이어본수
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        

        
        this.btnOrderAdd_onclick = function(obj,e)
        {
        	var nRow0100 = this.ds_rtsd0100.rowposition;
        	
        	var msg						= " 값이 없습니다.";
        	var nRow0104				= this.ds_rtsd0104.rowposition;
        	var contactRowType 			= this.ds_rtsd0104.getRowType(nRow0104);
        //
         
        // 	//var priceRow 				= this.ds_price.rowposition;
         	var modelRow 				= this.ds_model.rowposition;	
         	
         	
         	var custTp = nvl(this.div_custInfo.cb_custTp.value);
        	if( custTp == "" ){
        		alert( "사용자 유형" + msg);
        		return this.div_custInfo.cb_custTp.setFocus(true);
        		return false;
        	}
         	
         	
        	if(this.div_custInfo.cb_custTp.value==01){
        		if( this.div_custInfo.ed_birthDay.value == ""){
        				alert("법정생년월일을  확인하세요.");
        				return false;
        			}
        			this.ds_rtsd0100.setColumn( nRow0100, "repNm","");
        			this.ds_rtsd0100.setColumn( nRow0100, "buslNo","");
        			
        		}else {
        			if( this.div_custInfo.ed_buslNo.value == ""){
        				alert("사업자번호를 확인하세요.");
        				return false;
        			}
        			this.ds_rtsd0100.setColumn( nRow0100, "custNm","");
        			this.ds_rtsd0100.setColumn( nRow0100, "birthDay","");			
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
        		this.div_carInfo.set_enable(true);
        		this.div_carInfo.ed_carNo.set_enable(true);
        		return false;
        	}
        		
        	var agencyCd = nvl(this.ds_rtsd0104.getColumn(nRow0104, "agencyCd"));
        	if( agencyCd == "" ){
        		alert("장착점명" + msg);
        		this.div_installInfo.btn_searchAgency.setFocus(true);
        		return false;
        	}
        	
        	if( this.div_installInfo.ed_salesGroup.value == "" ){
        		alert("지사코드" + msg);
        		this.div_installInfo.btn_searchAgency.setFocus(true);
        		return false;
        	}
        	
        	if( this.div_installInfo.ed_salesOffice.value == "" ){
        		alert("지점코드" + msg);
        		this.div_installInfo.btn_searchAgency.setFocus(true);
        		return false;
        	}
        	
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
        	
        	
        	if(contactRowType==1){
        		this.ds_rtsd0104.setColumn( nRow0104, "periodCd",nvl(this.ds_productInfo.getColumn(0,"periodCd")));
        		this.ds_rtsd0104.setColumn( nRow0104, "ordDay",this.toDay);
        		this.ds_rtsd0104.setColumn( nRow0104, "ordId","03");
        		this.ds_rtsd0104.setColumn( nRow0104, "contentsCd",contentsCd);
        		this.ds_rtsd0104.setColumn( nRow0104, "frCd","Z");
        		this.ds_rtsd0104.setColumn( nRow0104, "cntCd", "0"+nvl(this.p_cntCd.value) );
        		this.ds_rtsd0104.setColumn( nRow0104, "payGb","9");
        		this.ds_rtsd0104.setColumn( nRow0104, "regiAmt",nvl(this.delComma(this.div_sumInfo.ed_SumtotalPrice.value)),0);
        		this.ds_rtsd0104.setColumn( nRow0104, "sumMonAmt","0");
        		this.ds_rtsd0104.setColumn( nRow0104, "monAmt","0");
         	}
         	else if(contactRowType==4 || contactRowType==2){
        	

        	this.ds_rtsd0104.setColumn( nRow0104, "ordDay",this.toDay);
        	this.ds_rtsd0104.setColumn( nRow0104, "ordId","03");
        	this.ds_rtsd0104.setColumn( nRow0104, "chanCd","10");
        	this.ds_rtsd0104.setColumn( nRow0104, "saleId","07");
        	this.ds_rtsd0104.setColumn( nRow0104, "periodCd",nvl(this.ds_productInfo.getColumn(0,"periodCd")));
        	this.ds_rtsd0104.setColumn( nRow0104, "regiCd","ZZZZ");
        	this.ds_rtsd0104.setColumn( nRow0104, "campYn","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "cDcrate" );
        	this.ds_rtsd0104.setColumn( nRow0104, "cDcamt","0");

        	this.ds_rtsd0104.setColumn( nRow0104, "custTp",this.div_custInfo.cb_custTp.value);
        	this.ds_rtsd0104.setColumn( nRow0104, "safekey");
        	this.ds_rtsd0104.setColumn( nRow0104, "grpYn","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "grpNo");
        	this.ds_rtsd0104.setColumn( nRow0104, "gDcrate" );
        	this.ds_rtsd0104.setColumn( nRow0104, "gDcamt","0");
        	this.ds_rtsd0104.setColumn( nRow0104, "lDcrate","10");
        	this.ds_rtsd0104.setColumn( nRow0104, "lDcamt","0");
        	this.ds_rtsd0104.setColumn( nRow0104, "fDcrate" );
        	this.ds_rtsd0104.setColumn( nRow0104, "fDcamt","0");
        	this.ds_rtsd0104.setColumn( nRow0104, "statCd","00");
        	this.ds_rtsd0104.setColumn( nRow0104, "cntCd", "0"+nvl(this.p_cntCd.value) );

        	this.ds_rtsd0104.setColumn( nRow0104, "contentsCd",this.div_carInfo.ed_contentsCd.value);
        	this.ds_rtsd0104.setColumn( nRow0104, "frCd", "Z");
        	this.ds_rtsd0104.setColumn( nRow0104, "cMileage");
        	this.ds_rtsd0104.setColumn( nRow0104, "payMthd","Z");
        	this.ds_rtsd0104.setColumn( nRow0104, "payDd","ZZ");
        	this.ds_rtsd0104.setColumn( nRow0104, "crdSeq","C0000000000000");
        	this.ds_rtsd0104.setColumn( nRow0104, "accChk","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "accStat","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "bkeyChk","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "batchKey","0000000000");
        	this.ds_rtsd0104.setColumn( nRow0104, "billYn","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "crdtStat","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "certCd","ZZ");
        	this.ds_rtsd0104.setColumn( nRow0104, "certStat","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "ordAgent");
        	this.ds_rtsd0104.setColumn( nRow0104, "psCd","999999");
        	this.ds_rtsd0104.setColumn( nRow0104, "cmsagYn","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "pcertYn","N");
        	this.ds_rtsd0104.setColumn( nRow0104, "regId");
        	this.ds_rtsd0104.setColumn( nRow0104, "regDt");
        	this.ds_rtsd0104.setColumn( nRow0104, "chgId");
        	this.ds_rtsd0104.setColumn( nRow0104, "chgDt");
        	this.ds_rtsd0104.setColumn( nRow0104, "agencyNm");
        	this.ds_rtsd0104.setColumn( nRow0104, "fcDay");
        	this.ds_rtsd0104.setColumn( nRow0104, "seasonCd",this.ds_productInfo.getColumn(0,"seasonCd"));		//하나만 
        	this.ds_rtsd0104.setColumn( nRow0104, "statNm");
        	this.ds_rtsd0104.setColumn( nRow0104, "saleCd",nvl(this.ed_SaleCd.value),0);
        	this.ds_rtsd0104.setColumn( nRow0104, "prdtGrp" );	
        	this.ds_rtsd0104.setColumn( nRow0104, "payGb","9");
        	this.ds_rtsd0104.setColumn( nRow0104, "regiAmt",nvl(this.delComma(this.div_sumInfo.ed_SumtotalPrice.value)),0);
        	this.ds_rtsd0104.setColumn( nRow0104, "sumMonAmt","0");
        	this.ds_rtsd0104.setColumn( nRow0104, "monAmt","0");
        	} 
        	 	
         	this.FN_goSave();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_goSave = function(){

        	//this.alert("this.p_frCd : " + this.p_frCd);
        	// 제품정보 저장	
        	var ds_productInfo = this.ds_productInfo.getRowCount();
        	this.ds_productInfo.set_updatecontrol(false);
        	for( var i = 0 ; i < ds_productInfo ; i++){
        		
        		//------- 저장시 외부 입력값들 --------
        		this.ds_productInfo.setColumn(i, "saleCd", this.ed_SaleCd.value);		// 판매코드
        		this.ds_productInfo.setColumn(i, "gdsGb", "1");  	// 제품구분
        		this.ds_productInfo.setColumn(i, "gdsGrp", "1");  	// 제품군
        		
        		this.ds_productInfo.setColumn(i, "matNm", ""); // 제품명를 null 처리 한다. 깨짐..
        		this.ds_productInfo.setColumn(i, "saleGdsCd", ""); // 상품코드 null 처리 한다. 깨짐..	
        		//---------------------------------------
        		this.ds_productInfo.setRowType(i, Dataset.ROWTYPE_INSERT);
        		
        	}
        	this.ds_productInfo.set_updatecontrol(true);
        	
        	// 프리미엄 서비스 서비스횟수설정(최초, 잔여)
        	var cnt = this.ds_rtsd0013.getRowCount();
        	if( cnt != 0 ){
        		for( var i = 0; i < this.ds_rtsd0013.getRowCount(); i++){
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
        	
        	// 부가 서비스 서비스횟수설정(최초, 잔여)	
        	var ds_ValuePrdtInfo_cnt = this.ds_ValuePrdtInfo.getRowCount();
        	this.ds_ValuePrdtInfo.set_updatecontrol(false);
        	for( var j = 0 ; j < ds_ValuePrdtInfo_cnt ; j++){
        		this.ds_ValuePrdtInfo.setRowType(j, Dataset.ROWTYPE_INSERT);
        	}
        	
        	this.ds_ValuePrdtInfo.set_updatecontrol(true);
        	
        	this.ds_rtsd0100.addColumn("custTp3", "string", 256);
        	
        	this.ds_rtsd0100.set_updatecontrol(false);
        	for( var i = 0 ; i < this.ds_rtsd0100.getRowCount() ; i++){
        		this.ds_rtsd0100.setColumn(i,"custTp3","03");
        		this.ds_rtsd0100.setColumn(i,"taxYn","N");
        		this.ds_rtsd0100.setColumn(i,"useYn","Y");
        		this.ds_rtsd0100.setColumn(i,"custNo","");
        		this.ds_rtsd0100.setRowType(i, Dataset.ROWTYPE_INSERT);
        	}
        	this.ds_rtsd0100.set_updatecontrol(true);
          	if( confirm( "저장하시겠습니까?") ){
         
          		var sSvcID        	= "saveDirectOrder";                    
        		var sController   	= "/rtms/sd/saveDirectOrder.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";

        		sInDatasets			+= " dsRtsd0100=ds_rtsd0100:A ";
        		sInDatasets   		+= " dsRtsd0104=ds_rtsd0104:A ";
        		sInDatasets			+= " dsRtsd0106=ds_productInfo:A ";
        		sInDatasets			+= " dsRtsd0013=ds_rtsd0013:A ";		
        		sInDatasets			+= " dsRtsd0041=ds_ValuePrdtInfo:A ";	
        		sInDatasets			+= " dsRtsd0401=ds_rtsd0401:A "; // 20181224 방문장착관련 
        		
        		sArgs += Ex.util.setParam("ordNo", 	nvl(this.ed_orderNo.value));
        		sArgs += Ex.util.setParam("periodCd", nvl(this.p_periodCd.value));
        		
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        	

        this.btnOrderAdd00_onclick = function(obj,e)
        {

        	var ordNo = this.ed_orderNo.value;

        	var matNm = this.ed_SaleProdNm.value;
        	var custNo = this.div_custInfo.ed_custNo.value;
        	var custNm  = nvl(this.div_custInfo.cb_custTp.value)=='02'?this.div_custInfo.ed_repNm.value:this.div_custInfo.ed_custNm.value;
        	var bizNo = nvl(this.div_custInfo.cb_custTp.value)=='02'?this.div_custInfo.ed_buslNo.value:this.div_custInfo.ed_birthDay.value;

        	var mobNo = this.div_custInfo.ed_mobNo.value;

        	var regiAmt = "0";

        	var onePymnt = this.delComma(this.div_sumInfo.ed_SumtotalPrice.value);
        	var p_recpTp	    = "90";
        	
        	var args = {"ordNo": ordNo, "matNm" : matNm ,"custNm": custNm, "mobNo" :mobNo 
        	,regiAmt : "0" ,"onePymnt" : onePymnt, "custNo" : custNo, "bizNo" : bizNo, "recpTp" : p_recpTp}; 
        	Ex.core.popup(this,"결제","re::RTREPrcmAmtNOnePymntRecp_pop.xfdl",args, "modaless=false");
        }

        
        //------------ 사용자 유형 -------------------------------------------------------------------------------
        this.div_custInfo_cb_custTp_onitemchanged = function(obj,e)
        {
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

        this.FN_cust01 = function(){
        	this.div_custInfo.st_custNm.set_visible(true);						//고객명
        	this.div_custInfo.ed_custNm.set_visible(true);						//고객명
        	this.div_custInfo.st_birthDay.set_visible(true);						//법정생년월일
        	this.div_custInfo.ed_birthDay.set_visible(true);						//법정생년월일
        	this.div_custInfo.st_repNm.set_visible(false);							//대표자명
        	this.div_custInfo.ed_repNm.set_visible(false);							//대표자명
        	this.div_custInfo.ed_repNm.set_value();
        	this.div_custInfo.st_buslNo.set_visible(false);							//사업자번호
        	this.div_custInfo.ed_buslNo.set_visible(false);							//사업자번호
        	this.div_custInfo.ed_buslNo.set_value();							//사업자번호	
        }

        this.FN_cust02 = function(){
        	this.div_custInfo.st_custNm.set_visible(false);						//고객명
        	this.div_custInfo.ed_custNm.set_visible(false);						//고객명
        	this.div_custInfo.ed_custNm.set_value();						//고객명
        	this.div_custInfo.st_birthDay.set_visible(false);						//법정생년월일
        	this.div_custInfo.ed_birthDay.set_visible(false);						//법정생년월일
        	this.div_custInfo.ed_birthDay.set_value();						//법정생년월일
        	this.div_custInfo.st_buslNo.set_visible(true);							 //사업자번호
        	this.div_custInfo.ed_buslNo.set_visible(true);							 //사업자번호
        	this.div_custInfo.st_repNm.set_visible(true);							//대표자명
        	this.div_custInfo.ed_repNm.set_visible(true);							//대표자명
        }
        //*************************************************************************************************************//

        
        // 수납후 callback 함수 호추 
        this.fn_popupCallback = function(){
        	
        	Ex.core.popup(this, "KCP 카드즉시출금 결과", "re::RTREPaymentCommCrdResult_pop.xfdl", args, "modaless=false");

        	var nRow0100 = this.ds_rtsd0100.rowposition;
        	
        	var msg						= " 값이 없습니다.";
        	var nRow0104				= this.ds_rtsd0104.rowposition;
        	var contactRowType 			= this.ds_rtsd0104.getRowType(nRow0104);
        //
         
        // 	//var priceRow 				= this.ds_price.rowposition;
         	var modelRow 				= this.ds_model.rowposition;

         
        	if(this.div_custInfo.cb_custTp.value==01){
        		if( this.div_custInfo.ed_birthDay.value == ""){
        			alert("법정생년월일을  확인하세요.");
        			return false;
        		}
        		this.ds_rtsd0100.setColumn( nRow0100, "repNm","");
        		this.ds_rtsd0100.setColumn( nRow0100, "buslNo","");
        		
        	}else {
        		if( this.div_custInfo.ed_buslNo.value == ""){
        			alert("사업자번호를 확인하세요.");
        			return false;
        		}
        		this.ds_rtsd0100.setColumn( nRow0100, "custNm","");
        		this.ds_rtsd0100.setColumn( nRow0100, "birthDay","");
        		
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
        		
        	var agencyCd = nvl(this.ds_rtsd0104.getColumn(nRow0104, "agencyCd"));
        	if( agencyCd == "" ){
        		alert("장착점명" + msg);
        		this.div_installInfo.btn_searchAgency.setFocus(true);
        		return false;
        	}
        	if( this.div_installInfo.ed_salesGroup.value == "" ){
        		alert("지사코드" + msg);
        		this.div_installInfo.btn_searchAgency.setFocus(true);
        		return false;
        	}	
        	if( this.div_installInfo.ed_salesOffice.value == "" ){
        		alert("지점코드" + msg);
        		this.div_installInfo.btn_searchAgency.setFocus(true);
        		return false;
        	}
        	
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
        	if(contactRowType==1){
        		this.ds_rtsd0104.setColumn( nRow0104, "periodCd",nvl(this.ds_productInfo.getColumn(0,"periodCd")));
        		this.ds_rtsd0104.setColumn( nRow0104, "ordDay",this.toDay);
        		this.ds_rtsd0104.setColumn( nRow0104, "ordId","03");
        		this.ds_rtsd0104.setColumn( nRow0104, "contentsCd",contentsCd);
        		this.ds_rtsd0104.setColumn( nRow0104, "cntCd", "0"+nvl(this.p_cntCd.value) );
        		this.ds_rtsd0104.setColumn( nRow0104, "frCd",frCd);
        		this.ds_rtsd0104.setColumn( nRow0104, "payGb","9");
        		this.ds_rtsd0104.setColumn( nRow0104, "regiAmt",nvl(this.delComma(this.div_sumInfo.ed_SumtotalPrice.value)),0);
        		this.ds_rtsd0104.setColumn( nRow0104, "sumMonAmt","0");
        		this.ds_rtsd0104.setColumn( nRow0104, "monAmt","0");
        		this.ds_rtsd0104.setColumn( nRow0104, "salesGroup",nvl(this.div_installInfo.ed_salesGroup.value));
        		this.ds_rtsd0104.setColumn( nRow0104, "salesOffice",nvl(this.div_installInfo.ed_salesOffice.value));
        		this.ds_rtsd0104.setColumn( nRow0104, "agencyCd",nvl(this.div_installInfo.ed_agencyCd.value));
         	}
         	else if(contactRowType==4){		

        		this.ds_rtsd0104.setColumn( nRow0104, "ordDay",this.toDay);
        		this.ds_rtsd0104.setColumn( nRow0104, "ordId","03");
        		this.ds_rtsd0104.setColumn( nRow0104, "chanCd","10");
        		this.ds_rtsd0104.setColumn( nRow0104, "saleId","07");
        		this.ds_rtsd0104.setColumn( nRow0104, "periodCd",nvl(this.ds_productInfo.getColumn(0,"periodCd")));
        		this.ds_rtsd0104.setColumn( nRow0104, "regiCd","ZZZZ");
        		this.ds_rtsd0104.setColumn( nRow0104, "campYn","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "cDcrate" );
        		this.ds_rtsd0104.setColumn( nRow0104, "cDcamt","0");

        		this.ds_rtsd0104.setColumn( nRow0104, "custTp",this.div_custInfo.cb_custTp.value);
        		this.ds_rtsd0104.setColumn( nRow0104, "safekey");
        		this.ds_rtsd0104.setColumn( nRow0104, "grpYn","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "grpNo");
        		this.ds_rtsd0104.setColumn( nRow0104, "gDcrate" );
        		this.ds_rtsd0104.setColumn( nRow0104, "gDcamt","0");
        		
        		this.ds_rtsd0104.setColumn( nRow0104, "lDcrate","10");
        		this.ds_rtsd0104.setColumn( nRow0104, "lDcamt","0");
        		this.ds_rtsd0104.setColumn( nRow0104, "fDcrate" );
        		this.ds_rtsd0104.setColumn( nRow0104, "fDcamt","0");

        
        		this.ds_rtsd0104.setColumn( nRow0104, "contentsCd",this.div_carInfo.ed_contentsCd.value);
        		this.ds_rtsd0104.setColumn( nRow0104, "frCd",this.div_carInfo.ed_frCd.value);
        		
        		this.ds_rtsd0104.setColumn( nRow0104, "cMileage");
        		this.ds_rtsd0104.setColumn( nRow0104, "payMthd","Z");
        		this.ds_rtsd0104.setColumn( nRow0104, "payDd","ZZ");
        		this.ds_rtsd0104.setColumn( nRow0104, "crdSeq","C0000000000000");
        		this.ds_rtsd0104.setColumn( nRow0104, "accChk","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "accStat","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "bkeyChk","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "batchKey","0000000000");
        		this.ds_rtsd0104.setColumn( nRow0104, "billYn","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "crdtStat","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "certCd","ZZ");
        		this.ds_rtsd0104.setColumn( nRow0104, "certStat","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "ordAgent");
        		this.ds_rtsd0104.setColumn( nRow0104, "psCd","999999");
        		this.ds_rtsd0104.setColumn( nRow0104, "cmsagYn","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "pcertYn","N");
        		this.ds_rtsd0104.setColumn( nRow0104, "regId");
        		this.ds_rtsd0104.setColumn( nRow0104, "regDt");
        		this.ds_rtsd0104.setColumn( nRow0104, "chgId");
        		this.ds_rtsd0104.setColumn( nRow0104, "chgDt");
        		this.ds_rtsd0104.setColumn( nRow0104, "agencyNm");
        		this.ds_rtsd0104.setColumn( nRow0104, "fcDay");
        		this.ds_rtsd0104.setColumn( nRow0104, "seasonCd",this.ds_productInfo.getColumn(0,"seasonCd"));		//하나만 
        		this.ds_rtsd0104.setColumn( nRow0104, "statNm");
        		this.ds_rtsd0104.setColumn( nRow0104, "saleCd",nvl(this.ed_SaleCd.value),0);
        		this.ds_rtsd0104.setColumn( nRow0104, "prdtGrp" );	
        		this.ds_rtsd0104.setColumn( nRow0104, "payGb","9");
        		this.ds_rtsd0104.setColumn( nRow0104, "regiAmt",nvl(this.delComma(this.div_sumInfo.ed_SumtotalPrice.value)),0);
        		this.ds_rtsd0104.setColumn( nRow0104, "sumMonAmt","0");
        		this.ds_rtsd0104.setColumn( nRow0104, "monAmt","0");
        		this.ds_rtsd0104.setColumn( nRow0104, "salesGroup",nvl(this.div_installInfo.ed_salesGroup.value));
        		this.ds_rtsd0104.setColumn( nRow0104, "salesOffice",nvl(this.div_installInfo.ed_salesOffice.value));
        		this.ds_rtsd0104.setColumn( nRow0104, "agencyCd",nvl(this.div_installInfo.ed_agencyCd.value));
        	} 
        	
        this.FN_goSave2();
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_goSave2 = function(){

        	//this.alert("this.p_frCd : " + this.p_frCd);
        	// 제품정보 저장	
        	var ds_productInfo = this.ds_productInfo.getRowCount();
        	this.ds_productInfo.set_updatecontrol(false);
        	for( var i = 0 ; i < ds_productInfo ; i++){
        		
        		//------- 저장시 외부 입력값들 --------
        		this.ds_productInfo.setColumn(i, "saleCd", this.ed_SaleCd.value);		// 판매코드
        		this.ds_productInfo.setColumn(i, "gdsGb", "1");  	// 제품구분
        		this.ds_productInfo.setColumn(i, "gdsGrp", "1");  	// 제품군
        		
        		this.ds_productInfo.setColumn(i, "matNm", ""); // 제품명를 null 처리 한다. 깨짐..
        		this.ds_productInfo.setColumn(i, "saleGdsCd", ""); // 상품코드 null 처리 한다. 깨짐..	
        		//---------------------------------------
        		this.ds_productInfo.setRowType(i, Dataset.ROWTYPE_INSERT);
        		
        	}
        	this.ds_productInfo.set_updatecontrol(true);
        	
        	// 프리미엄 서비스 서비스횟수설정(최초, 잔여)
        	var cnt = this.ds_rtsd0013.getRowCount();
        	if( cnt != 0 ){
        		for( var i = 0; i < this.ds_rtsd0013.getRowCount(); i++){
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
        	
        	// 부가 서비스 서비스횟수설정(최초, 잔여)	
        	var ds_ValuePrdtInfo_cnt = this.ds_ValuePrdtInfo.getRowCount();
        	this.ds_ValuePrdtInfo.set_updatecontrol(false);
        	for( var j = 0 ; j < ds_ValuePrdtInfo_cnt ; j++){
        		this.ds_ValuePrdtInfo.setRowType(j, Dataset.ROWTYPE_INSERT);
        	}
        	this.ds_ValuePrdtInfo.set_updatecontrol(true);

        	this.ds_rtsd0104.setColumn( 0, "statCd", "01");															//"01" : 계약접수

        	var carOwner = nvl(this.div_custInfo.ed_custNm.value);
        	if(nvl(this.div_custInfo.ed_repNm.value) == ""){
        		carOwner = nvl(this.div_custInfo.ed_custNm.value);
        	}else{
        		carOwner = nvl(this.div_custInfo.ed_repNm.value);
        	}

        	this.ds_rtsd0104.setColumn( 0, "carOwner", carOwner);
        	
          	if( confirm( "결제완료하시겠습니까?") ){
          	this.btnOrderAdd00.set_enable(false);
          		var sSvcID        	= "saveDirectOrder2";                    
        		var sController   	= "/rtms/sd/saveDirectOrder2.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";

        		/*sInDatasets			+= " dsRtsd0100=ds_rtsd0100:A ";*/
        		sInDatasets   		+= " dsRtsd0104=ds_rtsd0104:A ";
        		sInDatasets			+= " dsRtsd0106=ds_productInfo:A ";
        		sInDatasets			+= " dsRtsd0013=ds_rtsd0013:A ";		
        		sInDatasets			+= " dsRtsd0041=ds_ValuePrdtInfo:A ";
        		sInDatasets			+= " dsRtsd0401=ds_rtsd0401:A "; // 20181224 방문장착관련 
        		
        		
        		sArgs += Ex.util.setParam("ordNo", 	nvl(this.ed_orderNo.value));
        		sArgs += Ex.util.setParam("periodCd", nvl(this.p_periodCd.value));
        		
        		var fn_callBack		= "fn_callBack";
        		var bAsync	  = false;				//동기화추가(20190220)
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack, true, bAsync);
        	}	

        }

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //콤마추가
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

        this.buttoncontrol = function(num){
        	if(num==01){
        		this.div_carInfo.set_enable(false);
        		this.btnAddPrdt.set_visible(false);
        		this.btnAddPrdtDel.set_visible(false);
        		this.btnValuePrdtAdd.set_visible(false);
        		this.btnValuePrdtDel.set_visible(false);	
        		this.btnOrderAdd.set_visible(false);
        		this.btnOrderAdd00.set_visible(false);
        	}else if(num==00){
        		this.btnAddPrdt.set_visible(true);
        		this.btnAddPrdtDel.set_visible(true);
        		this.btnValuePrdtAdd.set_visible(true);
        		this.btnValuePrdtDel.set_visible(true);	
        		this.btnOrderAdd.set_visible(false);
        		this.btnOrderAdd00.set_visible(true);
        	}
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_model.addEventHandler("onrowposchanged", this.ds_model_onrowposchanged, this);
            this.ds_ValuePrdtInfo.addEventHandler("oncolumnchanged", this.saleMonAmtChg, this);
            this.ds_rtsd0013.addEventHandler("oncolumnchanged", this.prmmSvrComboGet, this);
            this.ds_seviceCd.addEventHandler("oncolumnchanged", this.prmmSvrComboGet, this);
            this.addEventHandler("onload", this.RTSDDirectOrder_onload, this);
            this.div_custInfo.btn_custNoSearch.addEventHandler("onclick", this.div_custInfo_btn_custNoSearch_onclick, this);
            this.div_custInfo.ed_birthDay.addEventHandler("onchanged", this.div_custInfo_ed_birthDay_onchanged, this);
            this.div_custInfo.cb_custTp.addEventHandler("onitemchanged", this.div_custInfo_cb_custTp_onitemchanged, this);
            this.div_custInfo.ed_buslNo.addEventHandler("onchanged", this.div_custInfo_ed_buslNo_onchanged, this);
            this.div_custInfo.cb_custTp2.addEventHandler("onitemchanged", this.div_search_cmb_searchCondition_onitemchanged, this);
            this.btn_orderNoSearch.addEventHandler("onclick", this.btn_orderNoSearch_onclick, this);
            this.btn_SalePrdtSearch.addEventHandler("onclick", this.btn_SalePrdtSearch_onclick, this);
            this.btnAddPrdt.addEventHandler("onclick", this.btnAddPrdt_onclick, this);
            this.btnAddPrdtDel.addEventHandler("onclick", this.btnAddPrdtDel_onclick, this);
            this.btnValuePrdtAdd.addEventHandler("onclick", this.btnValuePrdtAdd_onclick, this);
            this.btnValuePrdtDel.addEventHandler("onclick", this.btnValuePrdtDel_onclick, this);
            this.div_carInfo.cb_makerCd.addEventHandler("onitemchanged", this.div_carInfo_cb_makerCd_onitemchanged, this);
            this.div_carInfo.cb_model.addEventHandler("onitemchanged", this.div_carInfo_cb_model_onitemchanged, this);
            this.div_carInfo.ed_carNo.addEventHandler("onkeyup", this.div_carInfo_ed_carNo_onkeyup, this);
            this.div_carInfo.ed_carNo.addEventHandler("onchanged", this.div_carInfo_ed_carNo_onchanged, this);
            this.div_sumInfo.st_procDay00.addEventHandler("onclick", this.div_sumInfo_st_procDay00_onclick, this);
            this.btnOrderAdd.addEventHandler("onclick", this.btnOrderAdd_onclick, this);
            this.btnOrderAdd00.addEventHandler("onclick", this.btnOrderAdd00_onclick, this);
            this.div_installInfo.cal_procDay.addEventHandler("onchanged", this.div_installInfo_cal_procDay_onchanged, this);
            this.div_installInfo.btn_searchAgency.addEventHandler("onclick", this.div_installInfo_btn_searchAgency_onclick, this);
            this.div_installInfo.btn_visitSchd.addEventHandler("onclick", this.div_installInfo_btn_visitSchd_onclick, this);
            this.grid_svrCd.addEventHandler("oncellclick", this.prmmSvrComboSet, this);

        };

        this.loadIncludeScript("RTSDDirectOrder.xfdl");

       
    };
}
)();
