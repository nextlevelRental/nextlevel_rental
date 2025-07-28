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
                this.set_name("RTREPaymentComm_div");
                this.set_classname("test_form");
                this.set_titletext("수납유형");
                this._setFormPosition(0,0,536,181);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_cardPaymentHst", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"email\" type=\"STRING\" size=\"256\"/><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"secCrdNo\" type=\"STRING\" size=\"256\"/><Column id=\"crdCd\" type=\"STRING\" size=\"256\"/><Column id=\"crdNm\" type=\"STRING\" size=\"256\"/><Column id=\"appTime\" type=\"STRING\" size=\"256\"/><Column id=\"appNo\" type=\"STRING\" size=\"256\"/><Column id=\"noinf\" type=\"STRING\" size=\"256\"/><Column id=\"noinfType\" type=\"STRING\" size=\"256\"/><Column id=\"quota\" type=\"STRING\" size=\"256\"/><Column id=\"resCd\" type=\"STRING\" size=\"256\"/><Column id=\"resMsg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBatch", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"res_cd\" type=\"STRING\" size=\"256\"/><Column id=\"res_msg\" type=\"STRING\" size=\"256\"/><Column id=\"group_id\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"returnCode\" type=\"STRING\" size=\"256\"/><Column id=\"batch_key\" type=\"STRING\" size=\"256\"/><Column id=\"pay_type\" type=\"STRING\" size=\"256\"/><Column id=\"pay_id\" type=\"STRING\" size=\"256\"/><Column id=\"pay_cert_no\" type=\"STRING\" size=\"256\"/><Column id=\"pay_issue_cd\" type=\"STRING\" size=\"256\"/><Column id=\"pay_issue_nm\" type=\"STRING\" size=\"256\"/><Column id=\"ccertDay\" type=\"STRING\" size=\"256\"/><Column id=\"ccertSeq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R055", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_hashValue", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"hashValue\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_aesValue", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"rrn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_accImmWthdrMst", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ractDay\" type=\"STRING\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncRseq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"prtCncRmnnAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"refundYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_accPaymentHst", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordCd\" type=\"STRING\" size=\"256\"/><Column id=\"workGb\" type=\"STRING\" size=\"256\"/><Column id=\"method\" type=\"STRING\" size=\"256\"/><Column id=\"payGb\" type=\"STRING\" size=\"256\"/><Column id=\"pMid\" type=\"STRING\" size=\"256\"/><Column id=\"pOid\" type=\"STRING\" size=\"256\"/><Column id=\"pTrDt\" type=\"STRING\" size=\"256\"/><Column id=\"pTrTime\" type=\"STRING\" size=\"256\"/><Column id=\"pAccNo\" type=\"STRING\" size=\"256\"/><Column id=\"pBankCd\" type=\"STRING\" size=\"256\"/><Column id=\"pCustId\" type=\"STRING\" size=\"256\"/><Column id=\"pCustNm\" type=\"STRING\" size=\"256\"/><Column id=\"pUname\" type=\"STRING\" size=\"256\"/><Column id=\"pGoods\" type=\"STRING\" size=\"256\"/><Column id=\"pAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"pRm\" type=\"STRING\" size=\"256\"/><Column id=\"pBname\" type=\"STRING\" size=\"256\"/><Column id=\"pHash\" type=\"STRING\" size=\"256\"/><Column id=\"pTrNo\" type=\"STRING\" size=\"256\"/><Column id=\"pSatus\" type=\"STRING\" size=\"256\"/><Column id=\"pErrCd\" type=\"STRING\" size=\"256\"/><Column id=\"pRmesg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_accInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"secBnkNo\" type=\"STRING\" size=\"256\"/><Column id=\"bnkCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_crdImmWthdrMst", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"rcrdDay\" type=\"STRING\" size=\"256\"/><Column id=\"rcrdSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"appNo\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncRseq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncTno\" type=\"STRING\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"prtCncRmnnAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"refundYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_crdInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"secCrdNo\" type=\"STRING\" size=\"256\"/><Column id=\"crdCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_unpaidList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpNm\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"arreAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_vaccMst", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"rvaAmt\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"expiryAcc\" type=\"STRING\" size=\"256\"/><Column id=\"dpsNm\" type=\"STRING\" size=\"256\"/><Column id=\"smsSendTrgtNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cardCancelHst", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"modType\" type=\"STRING\" size=\"256\"/><Column id=\"modMny\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"remMny\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"modDesc\" type=\"STRING\" size=\"256\"/><Column id=\"resCd\" type=\"STRING\" size=\"256\"/><Column id=\"resMsg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultSBank", this);
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_collectionMoneyList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDD\" type=\"STRING\" size=\"256\"/><Column id=\"prePaid\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreMon\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pymntSchdlAmt", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"recvMon\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"endTp\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"totRentAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"pnltAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"servAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totRecvAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recvRt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"mfpRsnCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfpDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_accCancelHst", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"modType\" type=\"STRING\" size=\"256\"/><Column id=\"modMny\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"remMny\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"modDesc\" type=\"STRING\" size=\"256\"/><Column id=\"resCd\" type=\"STRING\" size=\"256\"/><Column id=\"resMsg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pymntSchdlMstList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpTrno\" type=\"STRING\" size=\"256\"/><Column id=\"prptMnct\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptDscnRt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totRntAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totPrptDcamt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totPrptAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptBlncAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptSttgTmbt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptFnshTmbt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pymntSchdlDtlList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeqU\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"schdSeqI\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"saleAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"dcAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"arreAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R054", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_kcpResult", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"resCd\" type=\"STRING\" size=\"256\"/><Column id=\"resMsg\" type=\"STRING\" size=\"256\"/><Column id=\"reqTx\" type=\"STRING\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"crdCd\" type=\"STRING\" size=\"256\"/><Column id=\"crdNm\" type=\"STRING\" size=\"256\"/><Column id=\"appTime\" type=\"STRING\" size=\"256\"/><Column id=\"appNo\" type=\"STRING\" size=\"256\"/><Column id=\"modDesc\" type=\"STRING\" size=\"256\"/><Column id=\"quota\" type=\"STRING\" size=\"256\"/><Column id=\"noinf\" type=\"STRING\" size=\"256\"/><Column id=\"noinfType\" type=\"STRING\" size=\"256\"/><Column id=\"modType\" type=\"STRING\" size=\"256\"/><Column id=\"modMny\" type=\"STRING\" size=\"256\"/><Column id=\"remMny\" type=\"STRING\" size=\"256\"/><Column id=\"panc_mod_mny\" type=\"STRING\" size=\"256\"/><Column id=\"panc_rem_mny\" type=\"STRING\" size=\"256\"/><Column id=\"amount\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_crdPymntParam", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"reqTx\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"workCd\" type=\"STRING\" size=\"256\"/><Column id=\"payMethodCd\" type=\"STRING\" size=\"256\"/><Column id=\"payMethodName\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"crdNo\" type=\"STRING\" size=\"256\"/><Column id=\"quotaopt\" type=\"STRING\" size=\"256\"/><Column id=\"expiryYy\" type=\"STRING\" size=\"256\"/><Column id=\"expiryMm\" type=\"STRING\" size=\"256\"/><Column id=\"cardauth\" type=\"STRING\" size=\"256\"/><Column id=\"cardpwd\" type=\"STRING\" size=\"256\"/><Column id=\"dcCd\" type=\"STRING\" size=\"256\"/><Column id=\"prptMon\" type=\"STRING\" size=\"256\"/><Column id=\"cncDay\" type=\"STRING\" size=\"256\"/><Column id=\"mfpCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfpRsnCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfpDesc\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"modType\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"modMny\" type=\"STRING\" size=\"256\"/><Column id=\"remMny\" type=\"STRING\" size=\"256\"/><Column id=\"refundYn\" type=\"STRING\" size=\"256\"/><Column id=\"prptSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"modDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_kcpCustomer", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R081", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_controlAuth", this);
            obj._setContents("<ColumnInfo><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"controlId\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"typeCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_cardImmWthdr", "absolute", "0", "0", "536", "181", null, null, this);
            obj.set_taborder("46");
            this.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0", "0", "536", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("7");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_cardNoTh", "absolute", "0", "0", "140", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("6");
            obj.set_text("카드번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", "536", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("8");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_expiryPrdTh", "absolute", "0", "30", "140", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("9");
            obj.set_text("카드유효기간");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "60", "536", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("10");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_quotaoptTh", "absolute", "0", "60", "140", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("11");
            obj.set_text("할부기간");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "90", "536", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_cardauthTh", "absolute", "0", "90", "140", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("13");
            obj.set_text("인증정보");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Edit("ed_cardauth", "absolute", "144", "95", "100", "21", null, null, this.div_cardImmWthdr);
            obj.set_taborder("4");
            obj.set_maxlength("10");
            obj.set_inputtype("number");
            obj.set_enable("false");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "120", "536", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_cardpwdTh", "absolute", "0", "120", "140", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("15");
            obj.set_text("비밀번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "150", "536", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("16");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_paymentAmtTh", "absolute", "0", "150", "140", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("17");
            obj.set_text("결제금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_paymentAmt", "absolute", "144", "150", "100", "31", null, null, this.div_cardImmWthdr);
            obj.set_taborder("18");
            obj.set_text("0원");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new MaskEdit("me_cardpwd", "absolute", "144", "125", "50", "21", null, null, this.div_cardImmWthdr);
            obj.set_taborder("5");
            obj.set_mask("{##}");
            obj.set_type("string");
            obj.style.set_align("center middle");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Combo("cbo_quotaopt", "absolute", "144", "65", "100", "21", null, null, this.div_cardImmWthdr);
            this.div_cardImmWthdr.addChild(obj.name, obj);
            var cbo_quotaopt_innerdataset = new Dataset("cbo_quotaopt_innerdataset", this.div_cardImmWthdr.cbo_quotaopt);
            cbo_quotaopt_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">일시불</Col></Row><Row><Col id=\"codecolumn\">2</Col><Col id=\"datacolumn\">2개월</Col></Row><Row><Col id=\"codecolumn\">3</Col><Col id=\"datacolumn\">3개월</Col></Row><Row><Col id=\"codecolumn\">4</Col><Col id=\"datacolumn\">4개월</Col></Row><Row><Col id=\"codecolumn\">5</Col><Col id=\"datacolumn\">5개월</Col></Row><Row><Col id=\"codecolumn\">6</Col><Col id=\"datacolumn\">6개월</Col></Row><Row><Col id=\"codecolumn\">7</Col><Col id=\"datacolumn\">7개월</Col></Row><Row><Col id=\"codecolumn\">8</Col><Col id=\"datacolumn\">8개월</Col></Row><Row><Col id=\"codecolumn\">9</Col><Col id=\"datacolumn\">9개월</Col></Row><Row><Col id=\"codecolumn\">10</Col><Col id=\"datacolumn\">10개월</Col></Row><Row><Col id=\"codecolumn\">11</Col><Col id=\"datacolumn\">11개월</Col></Row><Row><Col id=\"codecolumn\">12</Col><Col id=\"datacolumn\">12개월</Col></Row><Row><Col id=\"codecolumn\">13</Col><Col id=\"datacolumn\">13개월</Col></Row><Row><Col id=\"codecolumn\">14</Col><Col id=\"datacolumn\">14개월</Col></Row><Row><Col id=\"codecolumn\">15</Col><Col id=\"datacolumn\">15개월</Col></Row><Row><Col id=\"codecolumn\">16</Col><Col id=\"datacolumn\">16개월</Col></Row><Row><Col id=\"codecolumn\">17</Col><Col id=\"datacolumn\">17개월</Col></Row><Row><Col id=\"codecolumn\">18</Col><Col id=\"datacolumn\">18개월</Col></Row></Rows>");
            obj.set_innerdataset(cbo_quotaopt_innerdataset);
            obj.set_taborder("3");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("0");
            obj.set_text("일시불");
            obj.set_readonly("true");
            obj.set_index("0");
            obj = new Combo("cbo_expiryMm", "absolute", "144", "35", "100", "21", null, null, this.div_cardImmWthdr);
            this.div_cardImmWthdr.addChild(obj.name, obj);
            var cbo_expiryMm_innerdataset = new Dataset("cbo_expiryMm_innerdataset", this.div_cardImmWthdr.cbo_expiryMm);
            cbo_expiryMm_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">01</Col></Row><Row><Col id=\"codecolumn\">2</Col><Col id=\"datacolumn\">02</Col></Row><Row><Col id=\"codecolumn\">3</Col><Col id=\"datacolumn\">03</Col></Row><Row><Col id=\"codecolumn\">4</Col><Col id=\"datacolumn\">04</Col></Row><Row><Col id=\"codecolumn\">5</Col><Col id=\"datacolumn\">05</Col></Row><Row><Col id=\"codecolumn\">6</Col><Col id=\"datacolumn\">06</Col></Row><Row><Col id=\"codecolumn\">7</Col><Col id=\"datacolumn\">07</Col></Row><Row><Col id=\"codecolumn\">8</Col><Col id=\"datacolumn\">08</Col></Row><Row><Col id=\"codecolumn\">9</Col><Col id=\"datacolumn\">09</Col></Row><Row><Col id=\"codecolumn\">10</Col><Col id=\"datacolumn\">10</Col></Row><Row><Col id=\"codecolumn\">11</Col><Col id=\"datacolumn\">11</Col></Row><Row><Col id=\"codecolumn\">12</Col><Col id=\"datacolumn\">12</Col></Row></Rows>");
            obj.set_innerdataset(cbo_expiryMm_innerdataset);
            obj.set_taborder("1");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("1");
            obj.set_text("01");
            obj.set_index("0");
            obj = new Combo("cbo_expiryYy", "absolute", "285", "35", "100", "21", null, null, this.div_cardImmWthdr);
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("19");
            obj.set_text("19");
            obj.set_innerdataset("@ds_R081");
            obj.set_index("0");
            obj = new Static("Static11", "absolute", "244", "35", "21", "21", null, null, this.div_cardImmWthdr);
            obj.set_taborder("22");
            obj.set_text("월");
            obj.style.set_align("center middle");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "385", "35", "21", "21", null, null, this.div_cardImmWthdr);
            obj.set_taborder("23");
            obj.set_text("년");
            obj.style.set_align("center middle");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new MaskEdit("me_cardNo", "absolute", "144", "5", "200", "21", null, null, this.div_cardImmWthdr);
            obj.set_taborder("0");
            obj.style.set_align("center middle");
            obj.set_maskchar("_");
            obj.set_mask("####-{####}-{####}-####");
            obj.set_type("string");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "249", "95", "250", "21", null, null, this.div_cardImmWthdr);
            obj.set_taborder("25");
            obj.set_text("주민등록번호 앞 6자리, 사업자번호 10자리");
            this.div_cardImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "199", "125", "150", "21", null, null, this.div_cardImmWthdr);
            obj.set_taborder("26");
            obj.set_text("카드비밀번호 앞 2자리");
            this.div_cardImmWthdr.addChild(obj.name, obj);

            obj = new Div("div_vacc", "absolute", "0", "0", "536", "151", null, null, this);
            obj.set_taborder("48");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "90", null, "31", "0", null, this.div_vacc);
            obj.set_taborder("50");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0", "0", null, "31", "0", null, this.div_vacc);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("st_bankTh", "absolute", "0", "0", "140", "31", null, null, this.div_vacc);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_text("입금은행");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", null, "31", "0", null, this.div_vacc);
            obj.set_taborder("29");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("st_dpsNmTh", "absolute", "0", "30", "140", "31", null, null, this.div_vacc);
            obj.set_taborder("30");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_text("입금자명");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "60", null, "31", "0", null, this.div_vacc);
            obj.set_taborder("31");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("st_expiryAccTh", "absolute", "0", "60", "140", "31", null, null, this.div_vacc);
            obj.set_taborder("32");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_text("계좌만료일");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "120", null, "31", "0", null, this.div_vacc);
            obj.set_taborder("38");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("st_paymentAmtTh", "absolute", "0", "120", "140", "31", null, null, this.div_vacc);
            obj.set_taborder("39");
            obj.set_text("결제금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("st_paymentAmt", "absolute", "144", "120", "72", "31", null, null, this.div_vacc);
            obj.set_taborder("40");
            obj.set_text("0원");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Combo("cbo_bank", "absolute", "144", "5", "100", "21", null, null, this.div_vacc);
            this.div_vacc.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_innerdataset("@ds_R054");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Edit("ed_dpsNm", "absolute", "144", "35", "100", "21", null, null, this.div_vacc);
            obj.set_taborder("1");
            obj.set_maxlength("8");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "249", "35", "70", "21", null, null, this.div_vacc);
            obj.set_taborder("45");
            obj.set_text("8글자 이내");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "249", "65", "120", "21", null, null, this.div_vacc);
            obj.set_taborder("46");
            obj.set_text("당월이후로 설정불가");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Calendar("cal_expiryAcc", "absolute", "144", "65", "100", "21", null, null, this.div_vacc);
            this.div_vacc.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_smsSendTrgtNoTh", "absolute", "0", "90", "140", "31", null, null, this.div_vacc);
            obj.set_taborder("47");
            obj.set_text("SMS발송대상 번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Edit("ed_smsSendTrgtNo", "absolute", "144", "95", "100", "21", null, null, this.div_vacc);
            obj.set_taborder("48");
            obj.set_inputtype("number");
            obj.set_maxlength("11");
            this.div_vacc.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "249", "95", "160", "21", null, null, this.div_vacc);
            obj.set_taborder("49");
            obj.set_text("기본 : 고객핸드폰, 수정가능");
            this.div_vacc.addChild(obj.name, obj);

            obj = new Div("div_accImmWthdr", "absolute", "0", "0", "536", "181", null, null, this);
            obj.set_taborder("47");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "90", "536", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0", "0", "536", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_bankTh", "absolute", "0", "0", "140", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_text("은행");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", "536", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("29");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_acctNoTh", "absolute", "0", "30", "140", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("30");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_text("계좌번호");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "60", "536", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("31");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_acctNmTh", "absolute", "0", "60", "140", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("32");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_text("예금주명");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_accauthTh", "absolute", "0", "90", "140", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("34");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_text("생년월일/사업자번호");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Edit("ed_bizNo", "absolute", "144", "95", "100", "21", null, null, this.div_accImmWthdr);
            obj.set_taborder("3");
            obj.set_inputtype("number");
            obj.set_maxlength("10");
            obj.set_readonly("false");
            obj.set_enable("false");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "120", "536", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("36");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_wthdrTransAgreeTh", "absolute", "0", "120", "140", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("37");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_text("이체동의");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "150", null, "31", "0", null, this.div_accImmWthdr);
            obj.set_taborder("38");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_paymentAmtTh", "absolute", "0", "150", "140", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("39");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_text("결제금액");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Static("st_paymentAmt", "absolute", "144", "150", "72", "31", null, null, this.div_accImmWthdr);
            obj.set_taborder("40");
            obj.set_text("0원");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Combo("cbo_bank", "absolute", "144", "5", "100", "21", null, null, this.div_accImmWthdr);
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_innerdataset("@ds_R055");
            obj.set_datacolumn("cdNm");
            obj.set_codecolumn("cd");
            obj = new Button("btn_wthdrTransAgree", "absolute", "144", "125", "97", "22", null, null, this.div_accImmWthdr);
            obj.set_taborder("5");
            obj.set_text("출금이체동의");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("false");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Button("btn_accCertified", "absolute", "249", "95", "71", "22", null, null, this.div_accImmWthdr);
            obj.set_taborder("4");
            obj.set_text("계좌인증");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Edit("ed_ownerNm", "absolute", "144", "65", "100", "21", null, null, this.div_accImmWthdr);
            obj.set_taborder("2");
            obj.set_readonly("false");
            obj.set_enable("false");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Edit("ed_acctCd", "absolute", "144", "35", "176", "21", null, null, this.div_accImmWthdr);
            obj.set_taborder("1");
            obj.set_inputtype("number");
            obj.set_maxlength("20");
            this.div_accImmWthdr.addChild(obj.name, obj);
            obj = new Button("btn_accUnRegister", "absolute", "325", "95", "71", "22", null, null, this.div_accImmWthdr);
            obj.set_taborder("41");
            obj.set_text("계좌해지");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.div_accImmWthdr.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 536, 181, this.div_cardImmWthdr,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("46");

            	}
            );
            this.div_cardImmWthdr.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 536, 151, this.div_vacc,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("48");
            		p.set_visible("false");

            	}
            );
            this.div_vacc.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 536, 181, this.div_accImmWthdr,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("47");
            		p.set_visible("false");

            	}
            );
            this.div_accImmWthdr.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 536, 181, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("수납유형");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREPaymentComm_div.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPaymentComm_div.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 수납공통화면 > 결제Interface 공통
         * 02. 그룹명		: RTREPaymentComm_div.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-11-09
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-11-09		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include 
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.tordNo	  = "";
        this.custNo	  = "";
        this.custNm	  = "";
        this.bizNo	  = "";
        this.resCd	  = "";
        this.resMsg	  = "";
        this.reqTx	  = "";
        this.recpTp	  = "";

        this.userId   = application.gds_userInfo.getColumn(0,"userId");
        this.keyString = "";
        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.oKcpParam	 = {};								/* KCP 자동승인취소 Param	*/

        //this.hostKey	 = "DEV";							/* DEV						*/
        this.hostKey	 = "PROD";							/* PROD						*/

        if(this.hostKey == "DEV") {
        	this.PMid		 = "nexent1t";					/* 상점 ID(DEV)				*/
        	this.certKey	 = "ST160621162001215412";		/* 인증키(DEV)				*/
        	this.encryptKey	 = "SETTLEBANKISGOOD";			/* 암호화키(DEV)			*/
        } else if(this.hostKey == "PROD") {
        	this.PMid		 = "nexent1r";					/* 상점 ID(PROD)			*/
        	this.certKey	 = "ST1901171609479725212";		/* 인증키(PROD)			*/
        	this.encryptKey	 = "s7b9SHXt9h0T6gi8";			/* 암호화키(PROD)			*/
        }

        this.PTrNo; 										/* SettleBank 거래번호		*/
        this.oArgs;											/* SettleBank Parameter		*/
        this.jsonData;										/* SettleBank Callback Data	*/
        this.agreeYn	 = "N";								/* 출금이체동의여부		*/
        this.baseTimeout = 30;								/* Timeout Default 값		*/

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.listControlAuth("RE", "RTREPaymentComm_div");
        	
        	//세틀뱅크 I/F시 주문번호는 각사이클당 다르게 전송되어야 함.
        	//세틀뱅크 주문번호 = 주문번호 + 현재일시
        	this.keyString = new Date().getTime();
        	if(this.userId == "kstka"){
        		this.div_accImmWthdr.btn_accUnRegister.set_visible(true);
        	}
        	
        	if(this.userId == "kstka"){
        		this.div_cardImmWthdr.ed_cardauth.set_enable(true);
        		this.div_accImmWthdr.ed_ownerNm.set_enable(true);
        		this.div_accImmWthdr.ed_bizNo.set_enable(true);
        	}
        	
        	this.fn_init();
        }

        /**
         * 화면 초기화
         */
        this.fn_init = function() {
        	/* 공통코드 조회 */
        	this.fn_getBankCodeInfo();
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 공통코드 조회
         */
        this.fn_getBankCodeInfo = function() {
        	var sSvcID		 = "getBankCodeInfo";
        	var sController	 = "ntrms/re/getBankCodeInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_R055=outputR055 ds_R054=outputR054 ds_R081=outputR081";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 카드즉시출금 결제/환불
         */
        this.fn_processPayment = function() {
        	var ds = this.ds_crdPymntParam;
        	
        	var sSvcID		 = "processPayment";
        	var sController	 = "ntrms/re/processPayment.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_kcpResult=output ds_kcpCustomer=customer";
        	var sArgs		 = "";
        		
        		/* 공통 */
        		sArgs		+= Ex.util.setParam("reqTx",		 nvl(ds.getColumn(0, "reqTx")));			/* 결제/취소구분		*/
        		sArgs		+= Ex.util.setParam("custNo",		 nvl(ds.getColumn(0, "custNo")));			/* 고객번호			*/
        		sArgs		+= Ex.util.setParam("ordNo",		 nvl(ds.getColumn(0, "ordNo")));			/* 계약번호			*/
        		sArgs		+= Ex.util.setParam("workCd",		 nvl(ds.getColumn(0, "workCd")));			/* 업무구분			*/
        		
        		/* 결제 */ 
        		sArgs		+= Ex.util.setParam("payMethodCd",	 nvl(ds.getColumn(0, "payMethodCd")));		/* 지불방법코드		*/
        		sArgs		+= Ex.util.setParam("payMethodName", nvl(ds.getColumn(0, "payMethodName")));	/* 지불방법명			*/
        		sArgs		+= Ex.util.setParam("recpAmt",		 nvl(ds.getColumn(0, "recpAmt")));			/* 결제금액			*/
        		sArgs		+= Ex.util.setParam("crdNo",		 nvl(ds.getColumn(0, "crdNo")));			/* 카드번호			*/
        		sArgs		+= Ex.util.setParam("quotaopt",		 nvl(ds.getColumn(0, "quotaopt")));			/* 할부개월			*/
        		sArgs		+= Ex.util.setParam("expiryYy",		 nvl(ds.getColumn(0, "expiryYy")));			/* 유효기간(년)		*/
        		sArgs		+= Ex.util.setParam("expiryMm",		 nvl(ds.getColumn(0, "expiryMm")));			/* 유효기간(월)		*/
        		sArgs		+= Ex.util.setParam("cardauth",		 nvl(ds.getColumn(0, "cardauth")));			/* 인증정보			*/
        		sArgs		+= Ex.util.setParam("cardpwd",		 nvl(ds.getColumn(0, "cardpwd")));			/* 비밀번호			*/
        		sArgs		+= Ex.util.setParam("dcCd",			 nvl(ds.getColumn(0, "dcCd")));				/* 할인코드			*/
        		sArgs		+= Ex.util.setParam("prptMon",		 nvl(ds.getColumn(0, "prptMon")));			/* 선납개월			*/
        		sArgs		+= Ex.util.setParam("cncDay",		 nvl(ds.getColumn(0, "cncDay")));			/* 중도완납일			*/
        		sArgs		+= Ex.util.setParam("mfpCd",		 nvl(ds.getColumn(0, "mfpCd")));			/* 종료유형			*/
        		sArgs		+= Ex.util.setParam("mfpRsnCd",		 nvl(ds.getColumn(0, "mfpRsnCd")));			/* 완납해지사유코드	*/
        		sArgs		+= Ex.util.setParam("mfpDesc",		 nvl(ds.getColumn(0, "mfpDesc")));			/* 완납해지상세사유	*/
        		sArgs		+= Ex.util.setParam("servAmt",		 nvl(ds.getColumn(0, "servAmt")));			/* 추가납부금액		*/
        		
        		/* 환불 */
        		sArgs		+= Ex.util.setParam("modType",		 nvl(ds.getColumn(0, "modType")));			/* 요청구분			*/
        		sArgs		+= Ex.util.setParam("recvSeq",		 nvl(ds.getColumn(0, "recvSeq")));			/* 수납거래번호		*/
        		sArgs		+= Ex.util.setParam("modMny",		 nvl(ds.getColumn(0, "modMny")));			/* 취소요청금액		*/
        		sArgs		+= Ex.util.setParam("remMny",		 nvl(ds.getColumn(0, "remMny")));			/* 취소가능잔액		*/
        		sArgs		+= Ex.util.setParam("refundYn",		 nvl(ds.getColumn(0, "refundYn")));			/* 환불여부			*/
        		sArgs		+= Ex.util.setParam("prptSeq",		 nvl(ds.getColumn(0, "prptSeq")));			/* 요청일련번호		*/
        		sArgs		+= Ex.util.setParam("tno",			 nvl(ds.getColumn(0, "tno")));				/* KCP거래번호			*/
        		sArgs		+= Ex.util.setParam("modDesc",		 nvl(ds.getColumn(0, "modDesc")));			/* 요청사유			*/
        	
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 계좌즉시출금결제 저장
         */
        this.fn_saveAccImmWthdrPayment = function() {
        	var dsMst = this.ds_accImmWthdrMst;
        	var dsDtl = this.ds_unpaidList;
        	var dsAcc = this.ds_accInfo;
        	var div	  = this.div_accImmWthdr;

        	dsMst.clearData();
        	dsMst.addRow();
        	
        	/*alert(nvl(this.ds_unpaidList.getColumn(0, "recpTp")));*/
        	
        	/* 청구구분 */
        	if(this.parent.workCd == "MFP") {
        		/* 중도완납 수납 */
        		if(this.parent.div_pymntSchdlAmt.cbo_endTp.value == "E") {
        			dsMst.setColumn(0, "recpTp", "11");
        		} else if(this.parent.div_pymntSchdlAmt.cbo_endTp.value == "C") {
        			dsMst.setColumn(0, "recpTp", "41");
        		}
        	} else if(this.parent.popupYn == "Y" && this.parent.etcPop == "Y") {
        		dsMst.setColumn(0, "recpTp", this.recpTp);
        	} else {
        		dsMst.setColumn(0, "recpTp", nvl(this.ds_unpaidList.getColumn(0, "recpTp")));
        	}
        	
        	var recpAmt = parseInt(div.st_paymentAmt.text.split(",").join(""));
        	
        	dsMst.setColumn(0, "tordNo",  nvl(this.tordNo));	/* 통합청구계약번호					*/
        	dsMst.setColumn(0, "custNo",  nvl(this.custNo));	/* 고객번호							*/
        	dsMst.setColumn(0, "recpAmt", nvl(recpAmt));		/* 수납금액							*/
        	dsMst.setColumn(0, "recpPay", "P6");				/* 수납방법 : 세틀뱅크 계좌즉시출금	*/
        	dsMst.setColumn(0, "recpFg",  "01");				/* 수납유형 : 수납처리				*/
        	dsMst.setColumn(0, "tno",	  nvl(this.PTrNo));		/* 거래번호							*/
        	dsMst.setColumn(0, "cncStat", "N");					/* 수납취소여부						*/
        	
        	dsAcc.clearData();
        	dsAcc.addRow();
        	
        	dsAcc.setColumn(0, "tno",	   nvl(this.PTrNo));			/* 거래번호 */
        	dsAcc.setColumn(0, "secBnkNo", nvl(div.ed_acctCd.text));	/* 계좌번호 */
        	dsAcc.setColumn(0, "bnkCd",	   nvl(div.cbo_bank.value));	/* 은행코드 */
        	dsAcc.setColumn(0, "custNm",   nvl(div.ed_ownerNm.text));	/* 예금주명 */
        // 	alert(nvl(this.PTrNo));
        // 	alert(nvl(this.tordNo));
        // 	alert(nvl(this.custNo));
        // 	return;
        	var sSvcID		 = "saveAccImmWthdrPayment";
        	var sController	 = "ntrms/re/saveAccImmWthdrPayment.do";
        	var sInDatasets	 = "ds_accImmWthdrMst=ds_accImmWthdrMst ds_accImmWthdrDtl=ds_unpaidList ds_accInfo=ds_accInfo";
        	
        	if(this.parent.workCd == "PRPT") {
        		sInDatasets	+= " ds_pymntSchdlMstList=ds_pymntSchdlMstList ds_pymntSchdlDtlList=ds_pymntSchdlDtlList";
        	} else if(this.parent.workCd == "MFP") {
        		sInDatasets	+= " ds_pymntSchdlAmt=ds_pymntSchdlAmt";
        	}
        	
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("workCd", nvl(this.parent.workCd)); /* 화면구분ID */
        		sArgs		+= Ex.util.setParam("viewId", nvl(this.parent.viewId)); /* 화면구분ID */
        	var fn_callBack	 = "fn_callBack";
        	var bAsync		 = false;
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack, true, bAsync);
        }

        /**
         * 계좌즉시출금결제이력 저장
         */
        this.fn_saveAccImmWthdrPaymentHst = function() {
        	if(this.ds_accPaymentHst.getRowCount() > 0) {
        		var sSvcID		 = "saveAccImmWthdrPaymentHst";
        		var sController	 = "ntrms/re/saveAccImmWthdrPaymentHst.do";
        		var sInDatasets	 = "ds_accPaymentHst=ds_accPaymentHst";
        		var sOutDatasets = "";
        		var sArgs		 = "";
        		var fn_callBack	 = "fn_callBack";
        		var bAsync		 = false;
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack, true, bAsync);
        	} else {
        		this.alert("저장할 건이 없습니다.");
        		
        		return false;
        	}
        }

        /**
         * 계좌즉시출금취소 저장
         */
        this.fn_saveAccImmWthdrCancel = function() {
        	var ds		= this.ds_accImmWthdrMst;
        	var cncRseq	= this.parent.cncRseq;
        	
        	var sSvcID		 = "saveAccImmWthdrCancel";
        	var sController	 = "ntrms/re/saveAccImmWthdrCancel.do";
        	var sInDatasets	 = "ds_accImmWthdrMst=ds_accImmWthdrMst";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("cncRseq", nvl(cncRseq)); /* 취소거래번호	*/
        	var fn_callBack	 = "fn_callBack";
        	var bAsync		 = false;
        	
        	if(this.parent.workCd == "PRPT") {
        		/* 선납할인환불 */
        		var dsCncl	 = this.parent.ds_prePaymentMstList;
        		var nCnclRow = dsCncl.rowposition;
        		
        		var recvDay	= dsCncl.getColumn(nCnclRow, "recvDay");
        		var recvSeq	= dsCncl.getColumn(nCnclRow, "recvSeq");
        		var ordNo	= dsCncl.getColumn(nCnclRow, "ordNo");
        		var custNo	= dsCncl.getColumn(nCnclRow, "custNo");
        		
        		var prptSeq	= this.parent.ds_prePaymentMstList.getColumn(this.parent.ds_prePaymentMstList, "prptSeq");
        		
        		sArgs += Ex.util.setParam("workCd",	 "PRPT");	/* 화면구분ID		*/
        		sArgs += Ex.util.setParam("viewId",	 "prePayment");	/* 화면구분ID		*/
        		sArgs += Ex.util.setParam("prptSeq", nvl(prptSeq));	/* 선납순번		*/
        		sArgs += Ex.util.setParam("recvDay", nvl(recvDay));	/* 수납일자		*/
        		sArgs += Ex.util.setParam("recvSeq", nvl(recvSeq));	/* 수납거래번호	*/
        		sArgs += Ex.util.setParam("ordNo",   nvl(ordNo));	/* 계약번호		*/
        		sArgs += Ex.util.setParam("custNo",  nvl(custNo));	/* 고객번호		*/
        	} else if(this.parent.workCd == "MFP") {
        		/* 중도완납환불 */
        		var dsCncl	 = this.parent.ds_mfpRfndTrgtList;
        		var nCnclRow = dsCncl.rowposition;
        		
        		var recvDay	= dsCncl.getColumn(nCnclRow, "recvDay");
        		var recvSeq	= dsCncl.getColumn(nCnclRow, "recvSeq");
        		var ordNo	= dsCncl.getColumn(nCnclRow, "ordNo");
        		var custNo	= dsCncl.getColumn(nCnclRow, "custNo");
        		
        		sArgs += Ex.util.setParam("workCd",	 "MFP");	/* 화면구분ID		*/
        		sArgs += Ex.util.setParam("viewId",	 "middleFullPayment");	/* 화면구분ID		*/
        		sArgs += Ex.util.setParam("recvDay", nvl(recvDay));			/* 수납일자		*/
        		sArgs += Ex.util.setParam("recvSeq", nvl(recvSeq));			/* 수납거래번호	*/
        		sArgs += Ex.util.setParam("ordNo",   nvl(ordNo));			/* 계약번호		*/
        		sArgs += Ex.util.setParam("custNo",  nvl(custNo));			/* 고객번호		*/
        	}
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack, true, bAsync);
        }

        /**
         * 계좌즉시출금취소이력 저장
         */
        this.fn_saveAccCancelHst = function() {
        	if(this.ds_accPaymentHst.getRowCount() > 0) {
        		var sSvcID		 = "saveAccCancelHst";
        		var sController	 = "ntrms/re/saveAccCancelHst.do";
        		var sInDatasets	 = "ds_accCancelHst=ds_accCancelHst";
        		var sOutDatasets = "";
        		var sArgs		 = "";
        		var fn_callBack	 = "fn_callBack";
        		var bAsync		 = false;
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack, true, bAsync);
        	} else {
        		this.alert("저장할 건이 없습니다.");
        		
        		return false;
        	}
        }

        /**
         * ARS 녹취
         */
        this.fn_arsCallService = function() {
        	var div = this.div_accImmWthdr;
        	
        	var userType = "";	/* 구분(개인/사업자)			*/
        	var bizNo	 = "";	/* 생년월일 또는 사업자번호	*/
        	
        	if(this.parent.popupYn == "Y" && this.parent.etcPop == "Y") {
        		bizNo = this.parent.bizNo;
        		
        		if(bizNo.getLength() == 6) {
        			userType = "01";
        		} else if(bizNo.getLength() == 10) {
        			userType = "02";
        		}
        	} else {
        		userType = this.parent.ds_collectionMoneyList.getColumn(0, "custTp");
        		bizNo	 = this.parent.ds_collectionMoneyList.getColumn(0, "birthDay");
        	}
        	
        	var bankCd = nvl(div.cbo_bank.value);	/* 은행코드	*/
        	var bankNm = nvl(div.cbo_bank.text);	/* 은행명		*/
        	var acctCd = nvl(div.ed_acctCd.value);	/* 계좌번호	*/
        	
        	var acctCdLen  = acctCd.length;
        	var acctSubstr = acctCd.substr(0, 3);
        	
        	if((bankCd == "003") && ((acctCdLen == 10) || (acctCdLen == 11))) {
        		this.alert("평생계좌는 자동이체 신청이 불가능합니다.\n기업은행 : 계좌번호가 10자리, 11자리\n신한은행 : 계좌번호가 10자리~14자리면서 앞번호 010 시작");
        		
        		return false;
        	} else if((bankCd == "088") && ((acctCdLen == 10) || (acctCdLen == 11) || (acctCdLen == 12) || (acctCdLen == 13) || (acctCdLen == 14)) && (acctSubstr == "010")) {
        		this.alert("평생계좌는 자동이체 신청이 불가능합니다.\n기업은행:계좌번호가 10자리, 11자리\n신한은행:계좌번호가 10자리~14자리면서 앞번호 010 시작");
        		
        		return false;
        	}
        	
        	var custNo	= nvl(this.parent.custNo);		/* 고객번호	*/
        	var custNm	= nvl(this.parent.custNm);		/* 고객명		*/
        	var ownerNm	= nvl(div.ed_ownerNm.value);	/* 예금주명	*/
        	var mobNo	= nvl(this.parent.mobNo);		/* 휴대폰번호	*/
        	
        	/* Timeout 90초 */
        	this.changeTimeout(90);
        	
        	var sSvcID		 = "arsCallService";
        	var sController	 = "ntrms/re/arsCallService.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "dsBatch=cmdKey";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("userType",	userType);		/* 개인 / 법인구분				*/
        		sArgs		+= Ex.util.setParam("bankCd",	bankCd);		/* 은행코드						*/
        		sArgs		+= Ex.util.setParam("bankNm",	bankNm);		/* 은행명							*/
        		sArgs		+= Ex.util.setParam("acctCd",	acctCd);		/* 계좌번호						*/
        		sArgs		+= Ex.util.setParam("bizNo",	bizNo);			/* 사업자번호(10) 및 생년월일(6)	*/
        		sArgs		+= Ex.util.setParam("trNo",		this.PTrNo);	/* 거래번호						*/
        		sArgs		+= Ex.util.setParam("custNo",	custNo);		/* 고객번호						*/
        		sArgs		+= Ex.util.setParam("custNm",	custNm);		/* 고객명							*/
        		sArgs		+= Ex.util.setParam("ownerNm",	ownerNm);		/* 예금주							*/
        		sArgs		+= Ex.util.setParam("mobNo",	mobNo);			/* 휴대폰번호						*/
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * Get AES Value
         */
        this.fn_convertAesValue = function() {
        	this.ds_aesValue.clearData();
        	this.ds_aesValue.addRow();
        	
        	var custNm = this.div_accImmWthdr.ed_ownerNm.text;
        	var acctNo = this.div_accImmWthdr.ed_acctCd.text;
        	var rrn	   = this.div_accImmWthdr.ed_bizNo.text;
        	
        	this.ds_aesValue.setColumn(0, "custNm",	custNm);
        	this.ds_aesValue.setColumn(0, "acctNo",	acctNo);
        	this.ds_aesValue.setColumn(0, "rrn",	rrn);
        	
        	var sSvcID		 = "convertAesValue";
        	var sController	 = "ntrms/re/convertAesValue.do";
        	var sInDatasets	 = "input=ds_aesValue";
        	var sOutDatasets = "ds_aesValue=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("encryptKey", this.encryptKey);	/* 암호화키 */
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * Get Hash Value
         */
        this.fn_convertHashValue = function() {
        	this.ds_hashValue.clearData();
        	this.ds_hashValue.addRow();
        	
        	var hashValue = "";
        	var bankCd	  = this.div_accImmWthdr.cbo_bank.value;
        	var acctNo	  = this.div_accImmWthdr.ed_acctCd.text;
        	var custNm	  = this.fn_uriEncoding(this.div_accImmWthdr.ed_ownerNm.text);
        	var rrn		  = this.div_accImmWthdr.ed_bizNo.text;
        	
        	if(this.oArgs.trgtGbn == "4") {
        		/* 예금주조회 요청 */
        		
        		/* 업무구분 + 상점ID + 거래일자 + 거래일시 + 계좌번호(평문) + 예금주명(평문, URL Encode, UTF-8) + 인증키 */
        		hashValue = this.oArgs.payGb + this.oArgs.PMid + this.oArgs.PTrDt + this.oArgs.PTrTime + acctNo + custNm + this.certKey;
        	} else if(this.oArgs.trgtGbn == "5") {
        		/* ARS 출금계좌등록 요청 */
        		
        		/* 업무구분 + 상점ID + 은행코드 + 계좌번호(평문) + 고객ID + 예금주명(평문, URL Encode, UTF-8) + 생년월일(평문) + 인증키 */
        		hashValue = this.oArgs.payGb + this.oArgs.PMid + bankCd + acctNo + this.oArgs.PCustId + custNm + rrn + this.certKey;
        	} else if(this.oArgs.trgtGbn == "12") {
        		/* 결제(RP) Non UI 요청 */
        		
        		/* 업무구분 + 상점ID + 고객ID + 주문번호 + 거래금액 + 인증키 */
        		hashValue = this.oArgs.payGb + this.oArgs.PMid + this.oArgs.PCustId + this.oArgs.POid + this.keyString.toString() + this.oArgs.PAmt + this.certKey;
        	} else if(this.oArgs.trgtGbn == "3") {
        		/* 결제승인 요청 */
        		
        		/* 업무구분 + 상점ID + 거래번호 */
        		hashValue = this.oArgs.payGb + this.oArgs.PMid + this.oArgs.PTrNo;
        	} else if(this.oArgs.trgtGbn == "2") {
        		/* 업무 요청(RP, RT) */
        		
        		/* 업무구분 + 상점ID + 고객ID + 주문번호 + 거래금액 + 인증키 */
        		hashValue = this.oArgs.payGb + this.oArgs.PMid + this.oArgs.PCustId + this.oArgs.POid + this.keyString.toString() + this.oArgs.PAmt + this.certKey;
        	} else if(this.oArgs.trgtGbn == "11") {
        		/* 계좌해지(DE) Non UI 요청 */
        		
        		/* 업무구분 + 상점ID + 고객ID(평문) + 인증키  */
        		hashValue = this.oArgs.payGb + this.oArgs.PMid + this.oArgs.PCustId + this.certKey;
        	}
        	
        	this.ds_hashValue.setColumn(0, "hashValue", hashValue);
        	
        	var sSvcID		 = "convertHashValue";
        	var sController	 = "ntrms/re/convertHashValue.do";
        	var sInDatasets	 = "input=ds_hashValue";
        	var sOutDatasets = "ds_hashValue=output";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 가상계좌 발급
         */
        this.fn_vaccIssued = function() {
        	var div			  = this.div_vacc;
        	var ds			  = this.ds_vaccMst;
        	
        	var custNm		  = this.parent.ds_collectionMoneyList.getColumn(0, "custNm");
        	var bankCd		  = nvl(div.cbo_bank.value);									/* 은행코드			*/
        	var dpsNm		  = nvl(div.ed_dpsNm.text);										/* 입금자명			*/
        	var expiryAcc	  = nvl(div.cal_expiryAcc.value);								/* 결제만료일			*/
        	var smsSendTrgtNo = nvl(div.ed_smsSendTrgtNo.text);								/* SMS발송대상번호	*/
        	var paymentAmt	  = nvl(parseInt(div.st_paymentAmt.text.split(",").join("")));	/* 결제금액			*/
        	
        	ds.clearData();
        	ds.addRow();
        	
        	ds.setColumn(0, "custNo",		 this.custNo);
        	ds.setColumn(0, "custNm",		 nvl(custNm));
        	ds.setColumn(0, "tordNo",		 this.tordNo);
        	ds.setColumn(0, "rvaAmt",		 nvl(paymentAmt));
        	ds.setColumn(0, "bankCd",		 nvl(bankCd));
        	ds.setColumn(0, "expiryAcc",	 nvl(expiryAcc));
        	
        	//[20200525_01] 이름은 3자로 고정
        	if(nvl(dpsNm).length > 3){
        		dpsNm = nvl(dpsNm).substring(0, 4);
        	}
        	ds.setColumn(0, "dpsNm",		 nvl("넥센타이어_" + dpsNm)); //[20200525_01] 기관명_수취인명 으로 변경 (세틀뱅크 요청사항)
        	ds.setColumn(0, "smsSendTrgtNo", nvl(smsSendTrgtNo));
        	
        	var sSvcID		 = "vaccIssued";
        	var sController	 = "ntrms/re/vaccIssued.do";
        	
        	var sInDatasets	 = "ds_vaccMst=ds_vaccMst ds_unpaidList=ds_unpaidList";
        	
        	if(this.parent.workCd == "PRPT") {
        		sInDatasets	+= " ds_pymntSchdlMstList=ds_pymntSchdlMstList ds_pymntSchdlDtlList=ds_pymntSchdlDtlList";
        	}
        	
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("workCd", nvl(this.parent.workCd)); /* 화면구분ID */
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * Call SettleBank
         */
        this.fn_callSettleBank = function(sUrl) {
        	this.changeTimeout(90);
        	
        	var sSvcID		 = "callSettleBank";
        	var sController	 = "ntrms/re/callSettleBank.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_resultSBank=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("url", sUrl); /* JSON URL(String) */
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 공통코드 조회 */
        		case "getBankCodeInfo":
        			this.div_accImmWthdr.cbo_bank.set_index(0);
        			this.div_vacc.cbo_bank.set_index(0);
        			break;
        		
        		/* 카드즉시출금 결제/환불 */
        		case "processPayment":
        			var dsParam	= this.ds_crdPymntParam;
        			var dsRes	= this.ds_kcpResult;
        			var dsCust	= this.ds_kcpCustomer;
        			var tordNo	= dsParam.getColumn(0, "ordNo");
        			var recpAmt	= dsParam.getColumn(0, "recpAmt");
        			var modMny	= dsRes.getColumn(0, "panc_mod_mny");
        			var remMny	= dsRes.getColumn(0, "panc_rem_mny");
        			var quota	= this.div_cardImmWthdr.cbo_quotaopt.text;
        			
        			var args	= {  resCd		: nvl(dsRes.getColumn(0,   "resCd"))
        						   , resMsg		: nvl(dsRes.getColumn(0,   "resMsg"))
        						   , reqTx		: nvl(dsParam.getColumn(0, "reqTx"))
        						   , tordNo		: nvl(tordNo)
        						   , tno		: nvl(dsRes.getColumn(0,   "tno"))
        						   , recpAmtTxt	: nvl(this.fn_numberWithComma(recpAmt))
        						   , recpAmt	: nvl(recpAmt)
        						   , matNm		: nvl(dsRes.getColumn(0,   "matNm"))
        						   , custNm		: nvl(dsCust.getColumn(0,  "custNm"))
        						   , telNo		: nvl(dsCust.getColumn(0,  "telNo"))
        						   , mobNo		: nvl(dsCust.getColumn(0,  "mobNo"))
        						   , email		: nvl(dsCust.getColumn(0,  "emailAddr"))
        						   , crdCd		: nvl(dsRes.getColumn(0,   "crdCd"))
        						   , crdNm		: nvl(dsRes.getColumn(0,   "crdNm"))
        						   , appTime	: nvl(dsRes.getColumn(0,   "appTime"))
        						   , appNo		: nvl(dsRes.getColumn(0,   "appNo"))
        						   , quota		: nvl(quota)
        						   , noinf		: nvl(dsRes.getColumn(0,   "noinf"))
        						   , noinfType	: nvl(dsRes.getColumn(0,   "noinfType"))
        						   , modType	: nvl(dsParam.getColumn(0, "modType"))
        						   , amount		: nvl(dsRes.getColumn(0,   "amount"))
        						   , modMny		: nvl(this.fn_numberWithComma(modMny))
        						   , remMny		: nvl(this.fn_numberWithComma(remMny))
        						  };
        			
        			if(this.parent.popupYn == "Y") {
        				if(this.ds_kcpResult.getColumn(0, "resCd") == "0000") {
        					/* KCP 카드즉시출금 결과 Popup Call */
        					this.parent.close(this.parent.opener.fn_popupCallback(args));
        				}
        			}
        			
        			this.parent.fn_callCrdResultPop(args);
        			break;
        		
        		/* 계좌즉시출금결제 저장 */
        		case "saveAccImmWthdrPayment":
        			/* 계좌즉시출금결제이력 저장 */
        			this.fn_saveAccImmWthdrPaymentHst();
        			break;
        		
        		/* 계좌즉시출금결제이력 저장 */
        		case "saveAccImmWthdrPaymentHst":
        			if(this.parent.popupYn == "Y" && this.parent.etcPop == "Y") {
        				if(this.ds_resultSBank.getColumn(0, "PStatus") == "0021") {
        					this.parent.close(this.parent.opener.fn_popupCallback());
        				} else {
        					this.parent.close(this.alert("실패 : " + this.fn_uriDecoding(this.ds_resultSBank.getColumn(0, "PRmesg1"))));
        				}
        			} else {
        				if(this.ds_resultSBank.getColumn(0, "PStatus") == "0021") {
        					if(this.oArgs.trgtGbn == "4") {
        						/* 예금주 조회 */
        						this.alert("정상적으로 계좌인증 되었습니다.");
        					} else if(this.oArgs.trgtGbn == "5") {
        						/* 출금이체동의 */
        						this.alert("정상적으로 출금이체동의 되었습니다.");
        					} else if(this.oArgs.trgtGbn == "2") {
        						/* 결제취소 */
        						
        						/* 계좌즉시출금취소이력 저장 */
        						this.fn_saveAccCancelHst();
        					} else if(this.oArgs.trgtGbn == "11") {
        						/* 계좌해지(수납) */
        						this.alert("정상적으로 결제완료 되었습니다.");
        						this.parent.close();
        					} else if(this.oArgs.trgtGbn == "12") {
        						/* 결제승인 요청 */
        						this.fn_paymentApproved();
        					} else if(this.oArgs.trgtGbn == "3") {
        						/* 계좌해지 */
        						this.fn_accRevocation();
        					}
        				} else {
        					this.alert("실패 : " + this.fn_uriDecoding(this.ds_resultSBank.getColumn(0, "PRmesg1")));
        				}
        				
        // 				if(this.oArgs.trgtGbn == "12") {
        // 					/* 결제승인 요청 */
        // 					this.fn_paymentApproved();
        // 				} else if(this.oArgs.trgtGbn == "3") {
        // 					/* 계좌해지 */
        // 					this.fn_accRevocation();
        // 				}
        			}
        			break;
        		
        		/* 계좌즉시출금취소 저장 */
        		case "saveAccImmWthdrCancel":
        			/* 계좌즉시출금취소이력 저장 */
        			this.fn_saveAccImmWthdrPaymentHst();
        			break;
        		
        		/* 계좌즉시출금취소이력 저장 */
        		case "saveAccCancelHst":
        			if(this.ds_resultSBank.getColumn(0, "PStatus") == "0021") {
        				this.alert("정상적으로 환불완료 되었습니다.");
        				
        				if(this.parent.workCd == "") {
        					/* 계좌즉시출금 환불 */
        					this.parent.fn_retrieveAccImmWthdrList();
        				} else if(this.parent.workCd == "PRPT") {
        					/* 선납할인 환불 */
        					this.parent.fn_retrievePrePaymentMstList();
        				} else if(this.parent.workCd == "MFP") {
        					/* 중도완납 환불 */
        					this.parent.fn_retrieveMfpRfndTrgtList();
        				}
        			} else {
        				this.alert("환불실패 : " + this.resMsg);
        			}
        			break;
        			
        		/* ARS 녹취 */
        		case "arsCallService":
        			/* Timeout Default Set */
        			this.changeTimeout();
        			
        			this.div_accImmWthdr.btn_wthdrTransAgree.set_enable(false);
        			
        			var bankCd = this.div_accImmWthdr.cbo_bank.value;
        			
        			this.oArgs = {	trgtGbn	: "5"					/* 대상구분		*/
        						  ,	_method	: "regAcctNo"			/* API 구분			*/
        						  ,	payGb	: "RE"					/* 업무구분(등록)	*/
        						  ,	PTrNo	: this.PTrNo			/* 거래번호		*/
        						  ,	PMid	: this.PMid				/* 상점아이디		*/
        						  ,	POid	: this.parent.tordNo	/* 주문번호		*/
        						  ,	PBnkCd	: bankCd				/* 은행코드		*/
        						  ,	PCustId	: this.parent.custNo	/* 고객 ID			*/
        						 };
        			
        			this.fn_convertAesValue();
        			break;
        		
        		/* Get AES Value */
        		case "convertAesValue":
        			var ds = this.ds_aesValue;
        			
        			if(this.oArgs.trgtGbn == "4") {
        				this.oArgs.PCustNm = ds.getColumn(0, "custNm");
        				this.oArgs.PAcctNo = ds.getColumn(0, "acctNo");
        				this.oArgs.PRrn	   = ds.getColumn(0, "rrn");
        			} else if(this.oArgs.trgtGbn == "5") {
        				this.oArgs.PCustNm = ds.getColumn(0, "custNm");
        				this.oArgs.PAcctNo = ds.getColumn(0, "acctNo");
        				this.oArgs.PRrn	   = ds.getColumn(0, "rrn");
        			} else if(this.oArgs.trgtGbn == "12") {
        				this.oArgs.PAcctNo = ds.getColumn(0, "acctNo");
        			}
        			
        			this.fn_convertHashValue();
        			break;
        		
        		/* Get Hash Value */
        		case "convertHashValue":
        			this.oArgs.PHash = this.ds_hashValue.getColumn(0, "hashValue");
        			var sUrl		 = "";
        			var preUrl		 = "";
        			
        			if(this.hostKey == "PROD") {
        				//preUrl = "https://pay.";
        				preUrl = "https://npay.";
        			} else {
        				//preUrl = "https://testpay.";
        				preUrl = "https://tbnpay.";
        			}
        			
        			if(this.oArgs.trgtGbn == "4") {
        				/* 예금주조회 요청 */
        				sUrl += preUrl + "settlebank.co.kr/api/ApiMultiAction.do?";
        				sUrl += "_method="	+ nvl(this.oArgs._method);		/* API 구분						*/
        				sUrl += "&payGb="	+ nvl(this.oArgs.payGb);		/* 업무구분					*/
        				sUrl += "&PMid="	+ nvl(this.oArgs.PMid);			/* 상점아이디					*/
        				sUrl += "&POid="	+ nvl(this.oArgs.POid) + this.keyString.toString();			/* 주문번호					*/
        				sUrl += "&PTrDt="	+ nvl(this.oArgs.PTrDt);		/* 거래일자					*/
        				sUrl += "&PTrTime="	+ nvl(this.oArgs.PTrTime);		/* 거래일시					*/
        				sUrl += "&PBnkCd="	+ nvl(this.oArgs.PBnkCd);		/* 은행코드					*/
        				sUrl += "&PCustNm="	+ nvl(this.oArgs.PCustNm);		/* 예금주명					*/
        				sUrl += "&PAcctNo="	+ nvl(this.oArgs.PAcctNo);		/* 계좌번호					*/
        				sUrl += "&PRrn="	+ nvl(this.oArgs.PRrn);			/* 생년월일					*/
        				sUrl += "&PHash="	+ nvl(this.oArgs.PHash);		/* Hash 데이터					*/
        			} else if(this.oArgs.trgtGbn == "5") {
        				/* ARS 출금계좌등록 요청 */
        				sUrl += preUrl + "settlebank.co.kr/api/ApiMultiAction.do?";
        				sUrl += "_method="	+ nvl(this.oArgs._method);		/* API 구분						*/
        				sUrl += "&payGb="	+ nvl(this.oArgs.payGb);		/* 업무구분					*/
        				sUrl += "&PTrNo="	+ nvl(this.oArgs.PTrNo);		/* 거래번호					*/
        				sUrl += "&PMid="	+ nvl(this.oArgs.PMid);			/* 상점아이디					*/
        				sUrl += "&POid="	+ nvl(this.oArgs.POid) + this.keyString.toString();			/* 주문번호					*/
        				sUrl += "&PBnkCd="	+ nvl(this.oArgs.PBnkCd);		/* 은행코드					*/
        				sUrl += "&PAcctNo="	+ nvl(this.oArgs.PAcctNo);		/* 계좌번호					*/
        				sUrl += "&PCustId="	+ nvl(this.oArgs.PCustId);		/* 고객ID						*/
        				sUrl += "&PCustNm="	+ nvl(this.oArgs.PCustNm);		/* 예금주명					*/
        				sUrl += "&PRrn="	+ nvl(this.oArgs.PRrn);			/* 생년월일					*/
        				sUrl += "&PHash="	+ nvl(this.oArgs.PHash);		/* Hash 데이터					*/
        			} else if(this.oArgs.trgtGbn == "12") {
        				/* 결제(RP) Non UI 요청 */
        				var PBname = this.fn_uriEncoding(nvl(this.oArgs.PBname));
        				var PUname = this.fn_uriEncoding(nvl(this.oArgs.PUname));
        				var PGoods = this.fn_uriEncoding(nvl(this.oArgs.PGoods));
        				
        				sUrl += preUrl + "settlebank.co.kr/api/ApiMultiAction.do?";
        				sUrl += "_method="	+ nvl(this.oArgs._method);		/* API 구분						*/
        				sUrl += "&payGb="	+ nvl(this.oArgs.payGb);		/* 업무구분					*/
        				sUrl += "&PMid="	+ nvl(this.oArgs.PMid);			/* 상점아이디					*/
        				sUrl += "&PBname="	+ nvl(PBname);					/* 통장인자명					*/
        				sUrl += "&PCustId="	+ nvl(this.oArgs.PCustId);		/* 고객ID						*/
        				sUrl += "&PUname="	+ nvl(PUname);					/* 결제고객성명				*/
        				sUrl += "&POid="	+ nvl(this.oArgs.POid) + this.keyString.toString();			/* 주문번호					*/
        				sUrl += "&PGoods="	+ nvl(PGoods);					/* 결제상품명					*/
        				sUrl += "&PBnkCd="	+ nvl(this.oArgs.PBnkCd);		/* 은행코드					*/
        				sUrl += "&PAcctNo="	+ nvl(this.oArgs.PAcctNo);		/* 출금계좌번호				*/
        				sUrl += "&PAmt="	+ nvl(this.oArgs.PAmt);			/* 거래금액					*/
        				sUrl += "&PHash="	+ nvl(this.oArgs.PHash);		/* Hash 데이터					*/
        			} else if(this.oArgs.trgtGbn == "3") {
        				/* 결제승인 요청 */
        				sUrl += preUrl + "settlebank.co.kr/nexen/FirmPaymentAction.pay?";
        				sUrl += "payGb="	+ nvl(this.oArgs.payGb);		/* 업무구분					*/
        				sUrl += "&PMid="	+ nvl(this.oArgs.PMid);			/* 상점아이디					*/
        				sUrl += "&PTrNo="	+ nvl(this.oArgs.PTrNo);		/* 거래번호					*/
        				sUrl += "&PHash="	+ nvl(this.oArgs.PHash);		/* Hash 데이터					*/
        			} else if(this.oArgs.trgtGbn == "2") {
        				/* 업무 요청 */
        				var PGoods = this.fn_uriEncoding(nvl(this.oArgs.PGoods));
        				var PBname = this.fn_uriEncoding(nvl(this.oArgs.PBname));
        				
        				sUrl += preUrl + "settlebank.co.kr/nexen/FirmPaymentAction.pay?";
        				sUrl += "payGb="	  + nvl(this.oArgs.payGb);		/* 업무구분					*/
        				sUrl += "&PMid="	  + nvl(this.oArgs.PMid);		/* 상점아이디					*/
        				sUrl += "&PCustId="	  + nvl(this.oArgs.PCustId);	/* 고객ID						*/
        				sUrl += "&POid="	  + nvl(this.oArgs.POid) + this.keyString.toString();		/* 주문번호					*/
        				sUrl += "&PGoods="	  + nvl(PGoods);				/* 결제상품명					*/
        				sUrl += "&PAmt="	  + nvl(this.oArgs.PAmt);		/* 거래금액					*/
        				sUrl += "&PBname="	  + nvl(PBname);				/* 통장인자명					*/
        				sUrl += "&PNextUrl="  + nvl(this.oArgs.PNextUrl);	/* 인증후 화면 Url				*/
        				sUrl += "&PCancUrl="  + nvl(this.oArgs.PCancUrl);	/* 인증취소 Url				*/
        				sUrl += "&PRepayUrl=" + nvl(this.oArgs.PRepayUrl);	/* 관리자 페이지 완료후 Url	*/
        				sUrl += "&PTrNo="	  + nvl(this.oArgs.PTrNo);		/* 거래번호					*/
        				sUrl += "&PHash="	  + nvl(this.oArgs.PHash);		/* Hash 데이터					*/
        			} else if(this.oArgs.trgtGbn == "11") {
        				/* 계좌해지(DE) Non UI 요청 */
        				sUrl += preUrl + "settlebank.co.kr/api/ApiMultiAction.do?";
        				sUrl += "_method="	+ nvl(this.oArgs._method);		/* API 구분						*/
        				sUrl += "&payGb="	+ nvl(this.oArgs.payGb);		/* 업무구분					*/
        				sUrl += "&PMid="	+ nvl(this.oArgs.PMid);			/* 상점아이디					*/
        				sUrl += "&PCustId="	+ nvl(this.oArgs.PCustId);		/* 고객ID						*/
        				sUrl += "&PBnkCd="	+ nvl(this.oArgs.PBnkCd);		/* 은행코드					*/
        				sUrl += "&PHash="	+ nvl(this.oArgs.PHash);		/* Hash 데이터					*/
        			}
        			
        			this.fn_callSettleBank(sUrl);
        			break;
        		
        		/* 가상계좌 발급 */
        		case "vaccIssued":
        			this.parent.close(this.alert("가상계좌가 정상적으로 발급되었습니다."));
        			break;
        		
        		/* Call SettleBank */
        		case "callSettleBank":
        			/* userdata
        			 * PStatus	거래상태
        			 * PErrCd	거절코드
        			 * PRmesgl	메세지1
        			 * PTrNo	거래번호
        			 * PCustNm	고객명
        			 * trgtGbn	업무구분(FlowSeq)
        			 */
        			
        			/* Timeout Default Set */
        			this.changeTimeout();
        			
        			var ds	   = this.ds_resultSBank;
        			var dsHst  = this.ds_accPaymentHst;
        			var dsCncl = this.ds_accCancelHst;
        			var div	   = this.div_accImmWthdr;
        			
        			var custNm = this.div_accImmWthdr.ed_ownerNm.text;
        			var acctNo = this.div_accImmWthdr.ed_acctCd.text;
        			var rrn	   = this.div_accImmWthdr.ed_bizNo.text;
        			
        			if(this.oArgs.trgtGbn == "4") {
        				/* 예금주조회 요청									*/
        				/* PStatus	: 거래상태 - 성공 : 0021 / 실패 : 0031	*/
        				/* 			  거래내역없음 : 0092 / 시스템오류 : 0099*/
        				/* PErrCd	: 거절코드									*/
        				/* PTrNo	: 거래번호 - 세틀뱅크 거래번호			*/
        				/* PRmesg1	: 메시지1(URL Encoding UTF-8)				*/
        				if(ds.getColumn(0, "PStatus") == "0021") {
        					/* 성공 */
        					div.btn_wthdrTransAgree.set_enable(true);
        					this.PTrNo = ds.getColumn(0, "PTrNo");
        				} else {
        					div.btn_wthdrTransAgree.set_enable(false);
        				}
        				
        				dsHst.clearData();
        				dsHst.addRow();
        				
        				dsHst.setColumn(0, "custNo",  this.parent.custNo);
        				dsHst.setColumn(0, "ordCd",	  this.parent.tordNo);
        				dsHst.setColumn(0, "workGb",  "01");
        				dsHst.setColumn(0, "method",  this.oArgs._method);
        				dsHst.setColumn(0, "payGb",	  this.oArgs.payGb);
        				dsHst.setColumn(0, "pMid",	  this.oArgs.PMid);
        				dsHst.setColumn(0, "pOid",	  this.parent.tordNo);
        				dsHst.setColumn(0, "pTrDt",	  this.oArgs.PTrDt);
        				dsHst.setColumn(0, "pTrTime", this.oArgs.PTrTime);
        				dsHst.setColumn(0, "pAccNo",  acctNo);
        				dsHst.setColumn(0, "pBankCd", this.oArgs.PBnkCd);
        				dsHst.setColumn(0, "pCustId", this.parent.custNo);
        				dsHst.setColumn(0, "pCustNm", custNm);
        				dsHst.setColumn(0, "pUname",  "");
        				dsHst.setColumn(0, "pGoods",  "");
        				dsHst.setColumn(0, "pAmt",	  "");
        				dsHst.setColumn(0, "pRm",	  rrn);
        				dsHst.setColumn(0, "pBname",  "");
        				dsHst.setColumn(0, "pHash",	  this.oArgs.PHash);
        				dsHst.setColumn(0, "pTrNo",	  ds.getColumn(0, "PTrNo"));
        				dsHst.setColumn(0, "pSatus",  ds.getColumn(0, "PStatus"));
        				dsHst.setColumn(0, "pErrCd",  ds.getColumn(0, "pErrCd"));
        				dsHst.setColumn(0, "pRmesg",  this.fn_uriDecoding(ds.getColumn(0, "PRmesg1")));
        				
        				/* 계좌즉시출금결제이력 저장 */
        				this.fn_saveAccImmWthdrPaymentHst();
        			} else if(this.oArgs.trgtGbn == "5") {
        				/* ARS 출금계좌등록 요청								*/
        				/* PStatus	: 거래상태 - 성공 : 0021 / 실패 : 0031	*/
        				/* 			  시스템오류 : 0099						*/
        				/* PErrCd	: 거절코드									*/
        				/* PRmesg1	: 메시지1(URL Encoding UTF-8)				*/
        				if(ds.getColumn(0, "PStatus") == "0021") {
        					/* 성공 */
        					this.agreeYn = "Y";
        				} else {
        					this.agreeYn = "N";
        				}
        				
        				dsHst.clearData();
        				dsHst.addRow();
        				
        				dsHst.setColumn(0, "custNo",  this.parent.custNo);
        				dsHst.setColumn(0, "ordCd",	  this.parent.tordNo);
        				dsHst.setColumn(0, "workGb",  "02");
        				dsHst.setColumn(0, "method",  this.oArgs._method);
        				dsHst.setColumn(0, "payGb",	  this.oArgs.payGb);
        				dsHst.setColumn(0, "pMid",	  this.oArgs.PMid);
        				dsHst.setColumn(0, "pOid",	  this.parent.tordNo);
        				dsHst.setColumn(0, "pTrDt",	  "");
        				dsHst.setColumn(0, "pTrTime", "");
        				dsHst.setColumn(0, "pAccNo",  acctNo);
        				dsHst.setColumn(0, "pBankCd", this.oArgs.PBnkCd);
        				dsHst.setColumn(0, "pCustId", this.parent.custNo);
        				dsHst.setColumn(0, "pCustNm", custNm);
        				dsHst.setColumn(0, "pUname",  "");
        				dsHst.setColumn(0, "pGoods",  "");
        				dsHst.setColumn(0, "pAmt",	  "");
        				dsHst.setColumn(0, "pRm",	  rrn);
        				dsHst.setColumn(0, "pBname",  "");
        				dsHst.setColumn(0, "pHash",	  this.oArgs.PHash);
        				dsHst.setColumn(0, "pTrNo",	  this.oArgs.PTrNo);
        				dsHst.setColumn(0, "pSatus",  ds.getColumn(0, "PStatus"));
        				dsHst.setColumn(0, "pErrCd",  ds.getColumn(0, "pErrCd"));
        				dsHst.setColumn(0, "pRmesg",  this.fn_uriDecoding(ds.getColumn(0, "PRmesg1")));
        				
        				/* 계좌즉시출금결제이력 저장 */
        				this.fn_saveAccImmWthdrPaymentHst();
        			} else if(this.oArgs.trgtGbn == "12") {
        				/* 결제(RP) Non UI 요청									*/
        				/* PStatus	: 거래상태 - 성공 : 0021 / 실패 : 0031		*/
        				/* 			  거래내역없음 : 0092 / 시스템오류 : 0099	*/
        				/* PErrCd	: 거절코드										*/
        				/* PTrNo	: 거래번호 - 세틀뱅크 거래번호				*/
        				/* PRmesg1	: 메시지1(URL Encoding UTF-8)					*/
        				if(ds.getColumn(0, "PStatus") == "0021") {
        					/* 성공 */
        					this.PTrNo = ds.getColumn(0, "PTrNo");
        				}
        				
        				dsHst.clearData();
        				dsHst.addRow();
        				
        				dsHst.setColumn(0, "custNo",  this.parent.custNo);
        				dsHst.setColumn(0, "ordCd",	  this.parent.tordNo);
        				dsHst.setColumn(0, "workGb",  "03");
        				dsHst.setColumn(0, "method",  this.oArgs._method);
        				dsHst.setColumn(0, "payGb",	  this.oArgs.payGb);
        				dsHst.setColumn(0, "pMid",	  this.oArgs.PMid);
        				dsHst.setColumn(0, "pOid",	  this.parent.tordNo);
        				dsHst.setColumn(0, "pTrDt",	  "");
        				dsHst.setColumn(0, "pTrTime", "");
        				dsHst.setColumn(0, "pAccNo",  acctNo);
        				dsHst.setColumn(0, "pBankCd", this.oArgs.PBnkCd);
        				dsHst.setColumn(0, "pCustId", this.parent.custNo);
        				dsHst.setColumn(0, "pCustNm", custNm);
        				dsHst.setColumn(0, "pUname",  custNm);
        				dsHst.setColumn(0, "pGoods",  this.oArgs.PGoods);
        				dsHst.setColumn(0, "pAmt",	  this.oArgs.PAmt);
        				dsHst.setColumn(0, "pRm",	  "");
        				dsHst.setColumn(0, "pBname",  this.oArgs.PBname);
        				dsHst.setColumn(0, "pHash",	  this.oArgs.PHash);
        				dsHst.setColumn(0, "pTrNo",	  ds.getColumn(0, "PTrNo"));
        				dsHst.setColumn(0, "pSatus",  ds.getColumn(0, "PStatus"));
        				dsHst.setColumn(0, "pErrCd",  ds.getColumn(0, "pErrCd"));
        				dsHst.setColumn(0, "pRmesg",  this.fn_uriDecoding(ds.getColumn(0, "PRmesg1")));
        				
        				/* 계좌즉시출금결제이력 저장 */
        				this.fn_saveAccImmWthdrPaymentHst();
        			} else if(this.oArgs.trgtGbn == "3") {
        				/* 결제승인 요청										*/
        				/* PStatus	: 거래상태 - 성공 : 0021 / 실패 : 0031	*/
        				/* PErrCd	: 오류코드									*/
        				/* PTrNo	: 거래번호 - 인증결과시 부여				*/
        				/* PBnkCd	: 출금은행코드							*/
        				/* PRmesg1	: 메시지1(URL Encoding UTF-8)				*/
        				if(ds.getColumn(0, "PStatus") == "0021") {
        					/* 성공 */
        					this.PTrNo = ds.getColumn(0, "PTrNo");
        				}
        				
        				dsHst.clearData();
        				dsHst.addRow();
        				
        				dsHst.setColumn(0, "custNo",  this.parent.custNo);
        				dsHst.setColumn(0, "ordCd",	  this.parent.tordNo);
        				dsHst.setColumn(0, "workGb",  "04");
        				dsHst.setColumn(0, "method",  "");
        				dsHst.setColumn(0, "payGb",	  this.oArgs.payGb);
        				dsHst.setColumn(0, "pMid",	  this.oArgs.PMid);
        				dsHst.setColumn(0, "pOid",	  this.parent.tordNo);
        				dsHst.setColumn(0, "pTrDt",	  "");
        				dsHst.setColumn(0, "pTrTime", "");
        				dsHst.setColumn(0, "pAccNo",  "");
        				dsHst.setColumn(0, "pBankCd", "");
        				dsHst.setColumn(0, "pCustId", this.parent.custNo);
        				dsHst.setColumn(0, "pCustNm", "");
        				dsHst.setColumn(0, "pUname",  "");
        				dsHst.setColumn(0, "pGoods",  "");
        				dsHst.setColumn(0, "pAmt",	  "");
        				dsHst.setColumn(0, "pRm",	  "");
        				dsHst.setColumn(0, "pBname",  "");
        				dsHst.setColumn(0, "pHash",	  this.oArgs.PHash);
        				dsHst.setColumn(0, "pTrNo",	  ds.getColumn(0, "PTrNo"));
        				dsHst.setColumn(0, "pSatus",  ds.getColumn(0, "PStatus"));
        				dsHst.setColumn(0, "pErrCd",  ds.getColumn(0, "pErrCd"));
        				dsHst.setColumn(0, "pRmesg",  this.fn_uriDecoding(ds.getColumn(0, "PRmesg1")));
        				
        				/* 계좌즉시출금결제이력 저장 */
        				this.fn_saveAccImmWthdrPaymentHst();
        			} else if(this.oArgs.trgtGbn == "2") {
        				/* 업무 요청												*/
        				/* PStatus	: 거래상태	- 성공	  : 0021 / 실패		 : 0031	*/
        				/*						- 처리중 : 0051 / 중복요청 : 0061	*/
        				/* PErrCd	: 오류코드										*/
        				/* POid		: 주문번호										*/
        				/* PTrNo	: 거래번호	- 환불시 발생						*/
        				/* PBnkCd	: 출금은행코드								*/
        				/* PRmesg1	: 메시지1(URL Encoding UTF-8)					*/
        				/* PTrDt	: 거래일자(YYYYMMDD hhmnmss)					*/
        				
        				dsHst.clearData();
        				dsHst.addRow();
        				
        				dsHst.setColumn(0, "custNo",  this.custNo);
        				dsHst.setColumn(0, "ordCd",   this.tordNo);
        				dsHst.setColumn(0, "workGb",  "05");
        				dsHst.setColumn(0, "method",  "");
        				dsHst.setColumn(0, "payGb",   this.oArgs.payGb);
        				dsHst.setColumn(0, "pMid",	  this.oArgs.PMid);
        				dsHst.setColumn(0, "pOid",	  this.tordNo);
        				dsHst.setColumn(0, "pTrDt",   "");
        				dsHst.setColumn(0, "pTrTime", "");
        				dsHst.setColumn(0, "pAccNo",  "");
        				dsHst.setColumn(0, "pBankCd", "");
        				dsHst.setColumn(0, "pCustId", this.custNo);
        				dsHst.setColumn(0, "pCustNm", "");
        				dsHst.setColumn(0, "pUname",  "");
        				dsHst.setColumn(0, "pGoods",  this.oArgs.PGoods);
        				dsHst.setColumn(0, "pAmt",	  this.oArgs.PAmt);
        				dsHst.setColumn(0, "pRm",	  "");
        				dsHst.setColumn(0, "pBname",  this.oArgs.PBname);
        				dsHst.setColumn(0, "pHash",   this.oArgs.PHash);
        				dsHst.setColumn(0, "pTrNo",   ds.getColumn(0, "PTrNo"));
        				dsHst.setColumn(0, "pSatus",  ds.getColumn(0, "PStatus"));
        				dsHst.setColumn(0, "pErrCd",  ds.getColumn(0, "pErrCd"));
        				dsHst.setColumn(0, "pRmesg",  this.fn_uriDecoding(ds.getColumn(0, "PRmesg1")));
        				
        				var dsMst	  = this.ds_accImmWthdrMst;
        				var dsCnclHst = this.ds_accCancelHst;
        				var dsParent  = "";
        				var parentRow = 0;
        				
        				var modType		  = "";
        				var ractDay		  = "";
        				var recvSeq		  = 0;
        				var tno			  = "";
        				var modMny		  = 0;
        				var remMny		  = 0;
        				var prtCncRmnnAmt = 0;
        				var modDesc		  = "취소";
        				var refundYn	  = "";
        				var resCd		  = ds.getColumn(0, "PStatus");
        				var resMsg		  = this.fn_uriDecoding(ds.getColumn(0, "PRmesg1"));
        				
        				dsMst.clearData();
        				dsMst.addRow();
        				
        				if(this.parent.workCd == "PRPT") {
        					var dsParentMst	= this.parent.ds_prePaymentMstList;
        					var dsCalc		= this.parent.ds_prePymntAmtCalc;
        					var nMstRow		= dsParentMst.rowposition;
        					var nCalcRow	= dsCalc.rowposition;
        					
        					ractDay		  = nvl(dsParentMst.getColumn(nMstRow, "recvDay"));
        					recvSeq		  = nvl(dsParentMst.getColumn(nMstRow, "recvSeq"));
        					tno			  = nvl(this.PTrNo);
        					modMny		  = nvl(parseInt(dsCalc.getColumn(nCalcRow, "refundAmt")));
        					prtCncRmnnAmt = nvl(parseInt(dsCalc.getColumn(nCalcRow, "totRecvAmt")));
        				} else if(this.parent.workCd == "MFP") {
        					var dsMfp	= this.parent.ds_mfpRfndTrgtList;
        					var nMfpRow	= dsMfp.rowposition;
        					
        					ractDay		  = nvl(dsMfp.getColumn(nMfpRow, "cncDay"));
        					recvSeq		  = nvl(dsMfp.getColumn(nMfpRow, "recvSeq"));
        					tno			  = nvl(this.PTrNo);
        					modMny		  = nvl(parseInt(dsMfp.getColumn(nMfpRow, "dblWthAmt")));
        					prtCncRmnnAmt = nvl(parseInt(dsMfp.getColumn(nMfpRow, "orgnTrAmt")));
        				} else {
        					var dsAcc  = this.parent.ds_accImmWthdrList;
        					var accRow = dsAcc.rowposition;
        					
        					ractDay		  = nvl(dsAcc.getColumn(accRow, "ractDay"));
        					recvSeq		  = nvl(dsAcc.getColumn(accRow, "recvSeq"));
        					tno			  = nvl(dsAcc.getColumn(accRow, "tno"));
        					modMny		  = nvl(parseInt(this.oArgs.PAmt));
        					prtCncRmnnAmt = nvl(dsAcc.getColumn(accRow, "prtCncRmnnAmt"));
        				}
        				
        				if(modMny == prtCncRmnnAmt) {
        					/* 전체취소 */
        					modType = "STSC";
        					refundYn = "Y";
        				} else {
        					/* 부분취소 */
        					modType = "STPC";
        					refundYn = "P";
        				}
        				
        				prtCncRmnnAmt = prtCncRmnnAmt - modMny;
        				
        				dsMst.setColumn(0, "tordNo",		nvl(this.tordNo));		/* 통합청구계약번호		*/
        				dsMst.setColumn(0, "custNo",		nvl(this.custNo));		/* 고객번호				*/
        				dsMst.setColumn(0, "ractDay",		nvl(ractDay));			/* 계좌수납일자			*/
        				dsMst.setColumn(0, "recvSeq",		nvl(recvSeq));			/* 수납일련번호			*/
        				dsMst.setColumn(0, "tno",			nvl(tno));				/* 기존거래번호			*/
        				dsMst.setColumn(0, "prtCncRmnnAmt",	nvl(prtCncRmnnAmt));	/* 수납취소후남은금액		*/
        				dsMst.setColumn(0, "refundYn",		nvl(refundYn));			/* 환불여부				*/
        				
        				dsCnclHst.clearData();
        				dsCnclHst.addRow();
        				
        				dsCnclHst.setColumn(0, "tno",	  nvl(tno));			/* 거래번호		*/
        				dsCnclHst.setColumn(0, "modType", nvl(modType));		/* 요청종류		*/
        				dsCnclHst.setColumn(0, "modMny",  nvl(modMny));			/* 취소요청금액	*/
        				dsCnclHst.setColumn(0, "remMny",  nvl(prtCncRmnnAmt));	/* 취소가능금액	*/
        				dsCnclHst.setColumn(0, "modDesc", nvl(modDesc));		/* 취소사유		*/
        				dsCnclHst.setColumn(0, "resCd",	  nvl(resCd));			/* 결과코드		*/
        				dsCnclHst.setColumn(0, "resMsg",  nvl(resMsg));			/* 결과내용		*/
        				
        				if(ds.getColumn(0, "PStatus") == "0021") {
        					/* 성공 */
        					
        					/* 계좌즉시출금취소 저장 */
        					this.fn_saveAccImmWthdrCancel();
        				} else {
        					/* 계좌즉시출금결제이력 저장 */
        					this.fn_saveAccImmWthdrPaymentHst();
        				}
        			} else if(this.oArgs.trgtGbn == "11") {
        				/* 계좌해지(DE) Non UI 요청							*/
        				/* PStatus	: 거래상태 - 성공 : 0021 / 실패 : 0031	*/
        				/* 						  시스템오류 : 0099			*/
        				/* PErrCd	: 거절코드									*/
        				/* PRmesg1	: 메시지1(URL Encoding UTF-8)				*/
        				/* PTrNo	: 거래번호 - 세틀뱅크 거래번호			*/
        				
        				dsHst.clearData();
        				dsHst.addRow();
        				
        				dsHst.setColumn(0, "custNo",  this.parent.custNo);
        				dsHst.setColumn(0, "ordCd",	  this.parent.tordNo);
        				dsHst.setColumn(0, "workGb",  "06");
        				dsHst.setColumn(0, "method",  this.oArgs._method);
        				dsHst.setColumn(0, "payGb",	  this.oArgs.payGb);
        				dsHst.setColumn(0, "pMid",	  this.oArgs.PMid);
        				dsHst.setColumn(0, "pOid",	  this.parent.tordNo);
        				dsHst.setColumn(0, "pTrDt",	  "");
        				dsHst.setColumn(0, "pTrTime", "");
        				dsHst.setColumn(0, "pAccNo",  "");
        				dsHst.setColumn(0, "pBankCd", this.oArgs.PBnkCd);
        				dsHst.setColumn(0, "pCustId", this.parent.custNo);
        				dsHst.setColumn(0, "pCustNm", "");
        				dsHst.setColumn(0, "pUname",  "");
        				dsHst.setColumn(0, "pGoods",  this.oArgs.PGoods);
        				dsHst.setColumn(0, "pAmt",	  this.oArgs.PAmt);
        				dsHst.setColumn(0, "pRm",	  "");
        				dsHst.setColumn(0, "pBname",  this.oArgs.PBname);
        				dsHst.setColumn(0, "pHash",	  this.oArgs.PHash);
        				dsHst.setColumn(0, "pTrNo",	  this.PTrNo);
        				dsHst.setColumn(0, "pSatus",  ds.getColumn(0, "PStatus"));
        				dsHst.setColumn(0, "pErrCd",  ds.getColumn(0, "pErrCd"));
        				dsHst.setColumn(0, "pRmesg",  this.fn_uriDecoding(ds.getColumn(0, "PRmesg1")));
        				
        				if(ds.getColumn(0, "PStatus") == "0021") {
        					/* 성공 */
        					if(this.parent.workCd == "PRPT") {
        						/* 선납할인 */
        						
        						/* 선납할인 저장 */
        						this.parent.fn_savePrePayment();
        					} else if(this.parent.workCd == "MFP") {
        						/* 중도완납 */
        						
        						/* 중도완납 저장 */
        						this.parent.fn_saveMiddleFullPayment("P6", this.PTrNo);
        					} else {
        						this.fn_saveAccImmWthdrPayment();
        					}
        				} else {
        					/* 계좌즉시출금결제이력 저장 */
        					this.fn_saveAccImmWthdrPaymentHst();
        				}
        			}
        			break;
        		case "listControlAuth" :
        			var authYn = this.getControlAuthCheck("cardOwnerChange", "", this.userId);
        	
        			//타인명의 카드 결제 가능 (이은경사원만 가능하게 변경)
        			//김영작, 장채은 추가, 이은경 사원 삭제 [20220914_1]
        			if(authYn == "Y"){
        				this.div_cardImmWthdr.ed_cardauth.set_enable(true);
        			}
        			
        			break;
        		default:
        			break;
        	}
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/
        /**
         * 숫자 3자리마다 콤마추가
         */
        this.fn_numberWithComma = function(num) {
        	var len, point, str, bNegInt;
        	
        	var nNum	= parseInt(num);
        	var sNum	= "";
        	
        	if(nNum < 0) {
        		sNum = nNum.toString().substring(1);
        		bNegInt = "Y";
        	} else {
        		sNum = nNum.toString();
        		bNegInt = "N";
        	}
        	
        	point = sNum.length % 3;
        	len = sNum.length;
        	
        	str = sNum.substring(0, point);
        	while (point < len) {
        		if (str != "") str += ",";
        		str += sNum.substring(point, point + 3);
        		point += 3;
        	}
        	
        	if(bNegInt == "Y") {
        		str = "-" + str;
        	}
        	
        	return str;
        }

        /**
         * URIEncoding
         */
        this.fn_uriEncoding = function(uri) {
        	var encoded = encodeURI(uri);
        	
        	return encoded;
        }

        /**
         * URIDecoding
         */
        this.fn_uriDecoding = function(uri) {
        	var decoded	 = decodeURI(uri);
        		decoded	 = decoded.split("+").join(" ");
        	
        	return decoded;
        }

        /**
         * Set Timeout(time : sec)
         */
        this.changeTimeout = function() {
        	var len		= arguments.length;
        	var timeout	= this.baseTimeout;
        	
        	if(len > 0) {
        		timeout = Eco.isNumber(arguments[0]) ? arguments[0] : this.baseTimeout;
        	}
        	
        	application.set_httptimeout(timeout);
        }

        /**
         * 결제인증 12
         */
        this.fn_paymentCertified = function() {
        	var bankCd = this.div_accImmWthdr.cbo_bank.value;
        	var acctNo = this.div_accImmWthdr.ed_acctCd.text;
        	var uname  = this.div_accImmWthdr.ed_ownerNm.text;
        	var amt	   = this.div_accImmWthdr.st_paymentAmt.text.split(",").join("").replace("원", "");
        	
        	this.oArgs = {	trgtGbn	: "12"					/* 대상구분		*/
        				  ,	_method	: "payment"				/* API 구분			*/
        				  ,	payGb	: "RP"					/* 업무구분(결제)	*/
        				  ,	PMid	: this.PMid				/* 상점아이디		*/
        				  ,	PBname	: ""					/* 통장인자명		*/
        				  ,	PCustId	: this.parent.custNo	/* 고객 ID			*/
        				  ,	PUname	: uname					/* 결제상품명		*/
        				  ,	POid	: this.parent.tordNo	/* 주문번호		*/
        				  ,	PGoods	: this.parent.matNm		/* 결제상품명		*/
        				  ,	PBnkCd	: bankCd				/* 은행코드		*/
        				  ,	PAcctNo	: acctNo				/* 출금계좌번호	*/
        				  ,	PAmt	: amt					/* 거래금액		*/
        				 };
        	
        	this.fn_convertAesValue();
        }

        /**
         * 결제승인 3
         */
        this.fn_paymentApproved = function() {
        	this.oArgs = {  trgtGbn	: "3"			/* 대상구분		*/
        				  , payGb	: "RP"			/* 업무구분(결제)	*/
        				  , PMid	: this.PMid		/* 상점아이디		*/
        				  , PTrNo	: this.PTrNo	/* 거래번호		*/
        				 };
        	
        	this.fn_convertHashValue();
        }

        /**
         * 계좌해지 11
         */
        this.fn_accRevocation = function() {
        	var bankCd = this.div_accImmWthdr.cbo_bank.value;
        	
        	this.oArgs = {	trgtGbn	: "11"					/* 대상구분		*/
        				  ,	_method	: "unRegistBank"		/* API 구분			*/
        				  ,	payGb	: "DE"					/* 업무구분(해지)	*/
        				  ,	PMid	: this.PMid				/* 상점아이디		*/
        				  ,	PCustId	: this.parent.custNo	/* 고객 ID			*/
        				  ,	PBnkCd	: bankCd				/* 은행코드		*/
        				 };
        	
        	this.fn_convertHashValue();
        }

        /**
         * 결제취소 2
         */
        this.fn_accPaymentCancel = function() {
        	var amt	= this.div_accImmWthdr.st_paymentAmt.text.split(",").join("").replace("원", "");
        	var oid	= this.tordNo;
        	
        	if(this.parent.workCd == "") {
        		oid = this.tordNo + this.parent.ds_accImmWthdrList.getColumn(this.parent.ds_accImmWthdrList.rowposition, "pOidSeq");
        	} else if(this.parent.workCd == "PRPT") {
        		oid = this.tordNo + this.parent.ds_prePaymentMstList.getColumn(this.parent.ds_prePaymentMstList.rowposition, "pOidSeq");
        	} else if(this.parent.workCd == "MFP") {
        		oid = this.tordNo + this.parent.ds_mfpRfndTrgtList.getColumn(this.parent.ds_mfpRfndTrgtList.rowposition, "pOidSeq");
        	}
        	
        	this.oArgs = {	trgtGbn	: "2"			/* 대상구분		*/
        				  ,	payGb	: "RT"			/* 업무구분(해지)	*/
        				  ,	PMid	: this.PMid		/* 상점아이디		*/
        				  ,	PCustId	: this.custNo	/* 고객 ID			*/
        				  ,	POid	: oid			/* 주문번호		*/
        				  ,	PAmt	: amt			/* 거래금액		*/
        				  ,	PTrNo	: this.PTrNo	/* 거래번호		*/
        				 };
        	
        	this.fn_convertHashValue();
        }

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 계좌인증 4
         */
        this.btn_accCertified_onclick = function(obj,e) {
        	if(this.div_accImmWthdr.cbo_bank.value == "") {
        		this.alert("은행을 선택하십시오.");
        		
        		return false;
        	}
        	
        	var bankCd = this.div_accImmWthdr.cbo_bank.value;
        	var date   = new Date();
        	var trHour = date.getHours().toString();
        	if(trHour < 10){
        		trHour = "0" + trHour;
        	}
        	var trMin = date.getMinutes().toString();
        	if(trMin < 10){
        		trMin = "0" + trMin;
        	}
        	var trSec = date.getSeconds().toString();
        	if(trSec < 10){
        		trSec = "0" + trSec;
        	}
        	
        	var trTime = trHour + trMin + trSec;
        	
        	this.oArgs = {	trgtGbn	: "4"					/* 대상구분				*/
        				  ,	_method	: "authAcctOwnerName"	/* API 구분					*/
        				  ,	payGb	: "NA"					/* 업무구분(예금주조회)	*/
        				  ,	PMid	: this.PMid				/* 상점아이디				*/
        				  ,	POid	: this.parent.tordNo	/* 주문번호				*/
        				  ,	PTrDt	: this.parent.toDay		/* 거래일자				*/
        				  ,	PTrTime	: trTime				/* 거래일시				*/
        				  ,	PBnkCd	: bankCd				/* 은행코드				*/
        				 };
        	
        	this.fn_convertAesValue();
        }

        /**
         * 출금이체동의 5
         */
        this.btn_wthdrTransAgree_onclick = function(obj,e) {
        	/* ARS 녹취 */
        	this.fn_arsCallService();
        }

        this.div_accImmWthdr_btn_accUnRegister_onclick = function(obj,e)
        {
        	var sUrl		 = "";
        	var preUrl		 = "";
        	
        	if(this.hostKey == "PROD") {	
        		//20200319 kstka 
        		//preUrl = "https://pay.";
        		preUrl = "https://npay.";
        	} else {
        		//preUrl = "https://testpay.";
        		preUrl = "https://tbnpay.";
        	}
        	
        	this.oArgs = {	trgtGbn	: "11"					/* 대상구분		*/
        				  ,	_method	: "unRegistBank"		/* API 구분			*/
        				  ,	payGb	: "DE"					/* 업무구분(해지)	*/
        				  ,	PMid	: this.PMid				/* 상점아이디		*/
        				  ,	PCustId	: this.parent.custNo	/* 고객 ID			*/
        				  ,	PBnkCd	: this.div_accImmWthdr.cbo_bank.value /* 은행코드		*/
        				 };
        	
        	this.fn_convertHashValue();
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
            this.ds_unpaidList.addEventHandler("oncolumnchanged", this.ds_unpaidList_oncolumnchanged, this);
            this.ds_collectionMoneyList.addEventHandler("onrowposchanged", this.ds_collectionMoneyList_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_vacc.cal_expiryAcc.addEventHandler("onchanged", this.cal_expiryAcc_onchanged, this);
            this.div_accImmWthdr.ed_bizNo.addEventHandler("onchanged", this.ed_bizNo_onchanged, this);
            this.div_accImmWthdr.btn_wthdrTransAgree.addEventHandler("onclick", this.btn_wthdrTransAgree_onclick, this);
            this.div_accImmWthdr.btn_accCertified.addEventHandler("onclick", this.btn_accCertified_onclick, this);
            this.div_accImmWthdr.btn_accUnRegister.addEventHandler("onclick", this.div_accImmWthdr_btn_accUnRegister_onclick, this);

        };

        this.loadIncludeScript("RTREPaymentComm_div.xfdl");

       
    };
}
)();
