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
                this.set_name("RTREPrePayment_tab1");
                this.set_classname("re00050_cms");
                this.set_titletext("선수금 관리(계약별)");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"pndDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"pndAmt\" type=\"STRING\" size=\"256\"/><Column id=\"sbsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"balAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPayNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFgNm\" type=\"STRING\" size=\"256\"/><Column id=\"pndStat\" type=\"STRING\" size=\"256\"/><Column id=\"pndStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R021", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row></Rows>");
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

            obj = new Dataset("ds_detail", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"sbsSeq\" type=\"STRING\" size=\"256\"/><Column id=\"sbsIseq\" type=\"STRING\" size=\"256\"/><Column id=\"sbsDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"sbsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPayNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFgNm\" type=\"STRING\" size=\"256\"/><Column id=\"sbsTp\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_refund", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"pndDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"pndAmt\" type=\"STRING\" size=\"256\"/><Column id=\"sbsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"balAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPayNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFgNm\" type=\"STRING\" size=\"256\"/><Column id=\"pndStat\" type=\"STRING\" size=\"256\"/><Column id=\"pndStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "0", "10", "10", "437", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("4");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("5");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "109", "86", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("선수금 내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "124", null, "10", "9", null, this);
            obj.set_taborder("8");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "285", "1110", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1092", "82", null, null, this);
            obj.set_taborder("18");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("69");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("71");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("79");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static45", "absolute", "125", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static46", "absolute", "130", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", null, "12", "431", null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "33", "20", "45", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "379", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_text("선수금 상태");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "346", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("85");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "346", "32", "30", "44", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_RqstStat", "absolute", "491", "12", "160", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_innerdataset("ds_R021");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_text("전체");
            obj.set_index("0");
            obj = new Static("st_searchCondition01", "absolute", "24", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("91");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_ordNo", "absolute", "92", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("0");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_odrPopUp", "absolute", "212", "11", "20", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "24", "45", "64", "20", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNo", "absolute", "92", "45", "140", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "212", "44", "20", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNoKeyword", "absolute", "237", "45", "160", "21", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "93", "1122", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("20");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "437", null, null, this);
            obj.set_taborder("21");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "127", "53", null, "21", "966", null, this);
            obj.set_taborder("22");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "301", "110", "20", null, null, this);
            obj.set_taborder("23");
            obj.set_text("선수금 정리내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "316", null, "10", "9", null, this);
            obj.set_taborder("24");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_detail", "absolute", "10", "326", "1092", "167", null, null, this);
            obj.set_taborder("25");
            obj.set_binddataset("ds_detail");
            obj.set_autofittype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"50\"/><Column size=\"140\"/><Column size=\"150\"/><Column size=\"150\"/><Column size=\"150\"/><Column size=\"150\"/><Column size=\"150\"/><Column size=\"150\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"선수금정리일자\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"고객번호\"/><Cell col=\"4\" text=\"고객명\"/><Cell col=\"5\" text=\"정리금액\"/><Cell col=\"6\" text=\"수납방법\"/><Cell col=\"7\" text=\"수납유형\"/></Band><Band id=\"body\"><Cell displaytype=\"expr:(recpFg == '21') ?  &quot;checkbox&quot; : &quot;none&quot;\" text=\"bind:check\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" displaytype=\"date\" edittype=\"none\" style=\"cursor:hand;\" text=\"bind:sbsDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" style=\"cursor:hand;\" text=\"bind:ordNo\" calendardisplay=\"display\"/><Cell col=\"3\" style=\"cursor:hand;\" text=\"bind:custNo\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"none\" style=\"cursor:hand;\" text=\"bind:custNm\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;cursor:hand;selectline: ;\" text=\"bind:sbsAmt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" style=\"cursor:hand;\" text=\"bind:recpPayNm\"/><Cell col=\"7\" style=\"cursor:hand;\" text=\"bind:recpFgNm\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"총계\"/><Cell col=\"2\" style=\"align:right middle;\"/><Cell col=\"3\"/><Cell col=\"4\" style=\"align:right middle;\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_detail.getSum(&quot;sbsAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"6\"/><Cell col=\"7\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Confirm", "absolute", "1007", "107", "45", "22", null, null, this);
            obj.set_taborder("26");
            obj.set_text("정리");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Cancel", "absolute", "981", "299", "71", "22", null, null, this);
            obj.set_taborder("27");
            obj.set_text("정리취소");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "10", "133", "1092", "150", null, null, this);
            obj.set_taborder("28");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"50\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"발생일자\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"고객번호\"/><Cell col=\"4\" text=\"고객명\"/><Cell col=\"5\" text=\"선수금 발생금액\"/><Cell col=\"6\" text=\"정리금액\"/><Cell col=\"7\" text=\"선수금 잔액\"/><Cell col=\"8\" text=\"수납방법\"/><Cell col=\"9\" text=\"선수금상태\"/></Band><Band id=\"body\"><Cell displaytype=\"expr:(balAmt &gt; 0) ?  &quot;checkbox&quot; : &quot;none&quot;\" style=\"controlaccessibility: ;\" text=\"bind:check\" calendardisplay=\"edit\"/><Cell col=\"1\" displaytype=\"date\" edittype=\"none\" text=\"bind:pndDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"bind:ordNo\" calendardisplay=\"display\"/><Cell col=\"3\" text=\"bind:custNo\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"none\" text=\"bind:custNm\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;cursor: ;\" text=\"bind:pndAmt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;cursor: ;\" text=\"bind:sbsAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:balAmt\" mask=\"###,###,###,##0\"/><Cell col=\"8\" text=\"bind:recpPayNm\"/><Cell col=\"9\" text=\"bind:pndStatNm\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"총계\"/><Cell col=\"2\" style=\"align:right middle;\"/><Cell col=\"3\"/><Cell col=\"4\" style=\"align:right middle;\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;pndAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;sbsAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;balAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"8\"/><Cell col=\"9\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "1057", "107", "45", "22", null, null, this);
            obj.set_taborder("29");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "1057", "299", "45", "22", null, null, this);
            obj.set_taborder("30");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Refund", "absolute", "956", "107", "45", "22", null, null, this);
            obj.set_taborder("31");
            obj.set_text("환불");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1092, 82, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("18");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("re00050_cms");
            		p.set_titletext("선수금 관리(계약별)");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_search.edt_ordNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_search.edt_custNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_search.edt_custNoKeyword","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREPrePayment_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPrePayment_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 마감관리 > 선수금관리 > 선수금관리(계약별)
         * 02. 그룹명   : RTREPrePayment_tab1.xfdl
         * 03. 그룹설명 : 
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
         * FORM 변수 선언 영역
        ************************************************************************/

        	/***********************************************************************
        	 * 그룹 변수 선언부
        	 ************************************************************************/
        	this.toDay 		= ""; 	//현재날짜	 
            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------  	 
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 			
        		this.fn_init();
        	} 
            //-------------------------------------------------------------------------------   
        	//초기화  
        	//------------------------------------------------------------------------------- 	
        	this.fn_init = function() {
        		//공통코드조회
        		this.fn_getCommCode();		
        		//오늘날짜
        		this.fn_getToday();				
        		//버튼초기화		
        		this.fn_initBtn();	
        		
        		var auth = Ex.core.o_auth;
        		if( auth.exptAuthYn == "N" ){
        			this.Button00.set_enable(false);
        			this.Button01.set_enable(false);
        		}
        	}		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//오늘날짜 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getToday = function() 
        	{
        		var sSvcID        	= "getDate";                    
        		var sController   	= "/rtms/comm/getToday.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}			
         	//---------------------------------------------------------------------------------
        	// 공통코드 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getCommCode  = function() {
        		this.ds_R021.clearData();
        		var sSvcID      	= "getCommCode";  
        		var sController   	= "ntrms/re/getClosingMngCommCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_R021=outputR021";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}	

         	//---------------------------------------------------------------------------------
        	// 선수금 내역조회
        	//---------------------------------------------------------------------------------		
        	this.fn_search = function()
        	{
        		this.ds_list.clearData();		
        		this.ds_detail.clearData();
        		
        		var ordNo 	= nvl(this.div_search.edt_ordNo.value); 	//계약번호
        		var custNo 	= nvl(this.div_search.edt_custNo.value);	//고객번호
        		
        		if(ordNo == "" && custNo == "") {
        			alert("계약번호 또는 고객번호를 입력하세요.");
        			if(ordNo == "") {
        				this.div_search.edt_ordNo.setFocus();
        				return;
        			}
        			if(custNo == "") {
        				this.div_search.edt_custNo.setFocus();
        				return;			
        			}			
        		}
        		var sSvcID      	= "getPrePayList";  
        		var sController   	= "ntrms/re/getPrePayList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        	
        		sArgs += Ex.util.setParam("pndStat" , nvl(this.div_search.cbo_RqstStat.value));	//선수금상태
        		sArgs += Ex.util.setParam("ordNo"	, nvl(this.div_search.edt_ordNo.value));	//계약번호	
        		sArgs += Ex.util.setParam("custNo"	, nvl(this.div_search.edt_custNo.value));	//고객번호
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        	
         	//---------------------------------------------------------------------------------
        	// 선수금 정리내역
        	//---------------------------------------------------------------------------------		
        	this.fn_detailSearch = function()
        	{
        		this.ds_detail.clearData();	
        		var sSvcID      	= "getPrePayArrangeList";  
        		var sController   	= "ntrms/re/getPrePayArrangeList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_detail=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
            	
        		sArgs += Ex.util.setParam("ordNo"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition, "ordNo")));		//계약번호	
        		sArgs += Ex.util.setParam("custNo"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition, "custNo")));		//고객번호
        		sArgs += Ex.util.setParam("recvSeq"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition, "recvSeq")));	//수납거래번호
        		sArgs += Ex.util.setParam("ritmSeq"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition, "ritmSeq")));	//거래일련번호

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}	
        	
         	//---------------------------------------------------------------------------------
        	// 정리
        	//---------------------------------------------------------------------------------		
        	this.fn_prePayArrange = function()
        	{
        		var sSvcID      	= "prePayArrange";  
        		var sController   	= "ntrms/re/prePayArrange.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
            	sArgs += Ex.util.setParam("sbsDay"	, nvl(this.toDay));		//선수 정리일자(오늘날짜로 세팅)
        		sArgs += Ex.util.setParam("ordNo"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition, "ordNo")));		//계약번호	
        		sArgs += Ex.util.setParam("custNo"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition, "custNo")));		//고객번호
        		sArgs += Ex.util.setParam("recvSeq"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition, "recvSeq")));	//수납거래번호
        		sArgs += Ex.util.setParam("ritmSeq"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition, "ritmSeq")));	//거래일련번호
        		sArgs += Ex.util.setParam("vType"	, "P");	//처리구분 P:part A:All

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}	
        	
         	//---------------------------------------------------------------------------------
        	// 정리취소
        	//---------------------------------------------------------------------------------		
        	this.fn_prePayArrangeCancel = function()
        	{
        		var sSvcID      	= "prePayArrangeCancel";  
        		var sController   	= "ntrms/re/prePayArrangeCancel.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
            	sArgs += Ex.util.setParam("sbsDay"	, nvl(this.ds_detail.getColumn(this.ds_detail.rowposition, "sbsDay")));	//선수 정리일자
        		sArgs += Ex.util.setParam("ordNo"	, nvl(this.ds_detail.getColumn(this.ds_detail.rowposition, "ordNo")));	//계약번호	
        		sArgs += Ex.util.setParam("custNo"	, nvl(this.ds_detail.getColumn(this.ds_detail.rowposition, "custNo")));	//고객번호
        		sArgs += Ex.util.setParam("sbsSeq"	, nvl(this.ds_detail.getColumn(this.ds_detail.rowposition, "sbsSeq")));	//정리거래번호
        		sArgs += Ex.util.setParam("sbsIseq"	, nvl(this.ds_detail.getColumn(this.ds_detail.rowposition, "sbsIseq")));//정리거래일련번호

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	

        	}	
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	// callBack함수 
            //-------------------------------------------------------------------------------  	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) 
        		{
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "getDate":
        				break;			
        			//공통코드
        			case "getCommCode":
        				this.div_search.cbo_RqstStat.set_index(0);
        				break;		
        			//선수금내역			
        			case "getPrePayList":		
        				this.ds_list.addColumn("check", "STRING", 256);			
        				if(this.ds_list.rowcount == 0) {
        					this.grd_list.set_nodatatext("조회된 결과가 없습니다.");
        				}
        				break;	
        			//선수금 정리내역	
        			case "getPrePayArrangeList":	
        				this.ds_detail.addColumn("check", "STRING", 256);				
        				if(this.ds_detail.rowcount == 0) {
        					this.grd_detail.set_nodatatext("조회된 결과가 없습니다.");
        				}
        				//alert(this.ds_detail.saveXML());
        				break;					
        			//고객명조회	
        			case "listCustInfo":
        				if(this.ds_cust.rowcount > 0 ) {
        					this.div_search.edt_custNoKeyword.set_value(this.ds_cust.getColumn(0, "custNm"));
        					this.fn_search();
        				}	
        				break;		
        			//정리	
        			case "prePayArrange":	
        				alert(strErrorMsg);	
        				this.fn_search();
        				break;		
        			//정리취소	
        			case "prePayArrangeCancel":	
        				alert(strErrorMsg);	
        				this.fn_search();						
        				break;	
        			case "refundPrePay":	
        				alert(strErrorMsg);						
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
        	//계약번호  Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  		
        	this.edt_ordNo_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 )
        		{
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
        			//고객명 조회
        			this.fn_getCustNm();
        		}		
        	}	
        	//------------------------------------------------------------------------------
        	//grd_list_oncellclick
        	//------------------------------------------------------------------------------
        	this.grd_list_oncellclick = function(obj,e)
        	{
        		var nIndex = this.grd_list.getCellPos();
        		var colText = this.grd_list.getCellProperty( "Head", nIndex, "text" );	
        		//if(colText=="선택") {
        			this.ds_list.set_enableevent(false);
        			for (var i=0; i<=this.ds_list.rowcount; i++) {
        				if(this.ds_list.rowposition == i) {
        					//선수금 잔액이 있을경우에만 선택가능
        					if(parseInt(this.ds_list.getColumn(i,"balAmt"),10) > 0) {
        						this.ds_list.setColumn(i ,"check","1");					
        					}
        					else {
        						this.ds_list.setColumn(i ,"check","0");	
        					}
        				}
        				else {
        					this.ds_list.setColumn(i,"check","0");
        				}
        			}	
        			this.ds_list.set_enableevent(true);
        		//}
        		//else {
        			//정리금액이 0보다 크면 선수금 정리내역을 조회한다.
        			if(this.ds_list.getColumn(this.ds_list.rowposition, "sbsAmt") > 0) {
        				this.fn_detailSearch();
        			}
        			else {
        				this.ds_detail.clearData();
        			}
        		//}
        	}	
        	//------------------------------------------------------------------------------
        	//grd_detail_oncellclick
        	//------------------------------------------------------------------------------	
        	this.grd_detail_oncellclick = function(obj,e)
        	{
        		var nIndex = this.grd_detail.getCellPos();
        		var colText = this.grd_detail.getCellProperty( "Head", nIndex, "text" );	
        		//if(colText=="선택") {
        			this.ds_detail.set_enableevent(false);
        			for (var i=0; i<=this.ds_detail.rowcount; i++) {
        				if(this.ds_detail.rowposition == i) {
        					//수납유형이 선수대체('21')인 경우에만 선택가능
        					if(this.ds_detail.getColumn(i,"recpFg") == "21") {
        						this.ds_detail.setColumn(i ,"check","1");					
        					}
        					else {
        						this.ds_detail.setColumn(i ,"check","0");	
        					}
        				}
        				else {
        					this.ds_detail.setColumn(i,"check","0");
        				}
        			}	
        			this.ds_detail.set_enableevent(true);		
        	}
        	//------------------------------------------------------------------------------
        	//grd_detail_oncelldblclick
        	//------------------------------------------------------------------------------
        	this.grd_detail_oncelldblclick = function(obj,e)
        	{
        		var sRecvSeq = this.ds_list.getColumn(this.ds_list.rowposition,"recvSeq");	//수납거래번호
        		var args ={p_recvSeq:sRecvSeq, p_gubun:"prePay"};
        		Ex.core.popup(this,"수납세부조회","comm::RTCOMMTranReceiptDtl_pop.xfdl",args,"modaless=false");	
        	}

        	//------------------------------------------------------------------------------
        	//정리 버튼 클릭 이벤트
        	//------------------------------------------------------------------------------	
        	this.btn_Confirm_onclick = function(obj,e)
        	{
        		var nRowCnt = this.ds_list.getCaseCount("check == '1'");
        		//trace(this.ds_list.saveXML());
        		if(nRowCnt == 0) {
        			alert('정리할 내역을 선택하세요.');
        			return;
        		} 
        		if(nRowCnt > 1) {
        			alert('선수금 내역 정리는 단건 처리가능합니다.');
        			return;
        		}
        		
        		this.fn_prePayArrange();
        	}	
        	//------------------------------------------------------------------------------
        	//정리취소버튼 클릭 이벤트
        	//------------------------------------------------------------------------------	
        	this.btn_Cancel_onclick = function(obj,e)
        	{
        		var nRowCnt = this.ds_detail.getCaseCount("check == '1'");
        		//trace(this.ds_detail.saveXML());
        		if(nRowCnt == 0) {
        			alert('정리취소할 내역을 선택하세요.');
        			return;
        		} 
        		if(nRowCnt > 1) {
        			alert('선수금 정리내역 정리취소는 단건 처리가능합니다.');
        			return;
        		}
        		
        		this.fn_prePayArrangeCancel();		
        	}	
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//고객명 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCustNm = function() {
        		this.ds_cust.clearData();
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
        	//계약번호 팝업창
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
        	// 계약번호조회팝업창 파라미터 반환
            //-------------------------------------------------------------------------------  		
        	this.returnOrderNoInfo = function(arr) {
        		if(arr[0].rowcount > 0) 
        		{	
        			this.div_search.edt_ordNo.set_value(arr[0].getColumn(0,"ordNo"));
        		}
        	}	
            //-------------------------------------------------------------------------------  
        	// 고객조회팝업창 파라미터 반환
            //-------------------------------------------------------------------------------  		
        	this.returnCustInfo = function(arr) {
        		if(arr[0].rowcount > 0) 
        		{	
        			if(nvl(arr[0].getColumn(0,"userId")) != "") { 
        				this.div_search.edt_custRegNo.set_value(arr[0].getColumn(0,"userId"));
        			}
        			if(nvl(arr[0].getColumn(0,"userNm")) != "") { 			
        				this.div_search.edt_custRegNoKeyword.set_value(arr[0].getColumn(0,"userNm"));
        			}
        			if(nvl(arr[0].getColumn(0,"custNo")) != "") { 
        				this.div_search.edt_custNo.set_value(arr[0].getColumn(0,"custNo"));			
        			}
        			if(nvl(arr[0].getColumn(0,"custNm")) != "") { 	
        				this.div_search.edt_custNoKeyword.set_value(arr[0].getColumn(0,"custNm"));								
        			}
        		}
        	}		
        	//---------------------------------------------------------------------------------
        	// 버튼생성
        	//---------------------------------------------------------------------------------
        	this.fn_initBtn  = function() {
        		/* 1. N : 신규추가
        		 * 2. S : 조회
        		 * 3. C : 데이타생성
        		 * 4. E : 엑셀데이타생성
        		 * 5. AG: 집계
        		 * 6. DN: 다운
        		 */	
        		this.parent.parent.parent.setButton("S",this);		
        	}

        

        	this.Button00_onclick = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grd_list);
        	}

        	this.Button01_onclick = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grd_detail);
        	}

        	//-------------------------------------------------------------------------------  
        	// 선수금 환불 처리
            //-------------------------------------------------------------------------------
        	this.btn_Refund_onclick = function(obj,e)
        	{
        		var userId = application.gds_userInfo.getColumn(0, "userId");
        		var userGrp = application.gds_userInfo.getColumn(0, "userGrp");
        		//20200611 환불권한은 렌탈팀 이은경사원만 가능
        		//20221101 환불권한은 영업관리자 권한 모두 부여
        		if(userGrp != "01"){
        			this.alert("선수금 환불 권한이 존재하지 않습니다.");
        			return;
        		}
        		
        		var pndStat = this.ds_list.getColumn(this.ds_list.rowposition, "pndStat");
        		
        		if(pndStat == "S"){
        			this.alert("처리할 선수금내역이 존재하지 않습니다.");
        			return;
        		}
        		
        		this.ds_refund.clearData();
        		this.ds_refund.addRow();
        		this.ds_refund.copyRow(0, this.ds_list, this.ds_list.rowposition);
        		
        		var sSvcID        	= "refundPrePay";                    
        		var sController   	= "/ntrms/re/prePayRefund.do";
        		var sInDatasets   	= "ds_refund=ds_refund";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("custNo", this.div_search.edt_custNo.value);			
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.edt_ordNo.addEventHandler("onkeyup", this.edt_ordNo_onkeyup, this);
            this.div_search.btn_odrPopUp.addEventHandler("onclick", this.fn_odrPopUp, this);
            this.div_search.edt_custNo.addEventHandler("onkeyup", this.custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.grd_detail.addEventHandler("oncelldblclick", this.grd_detail_oncelldblclick, this);
            this.grd_detail.addEventHandler("oncellclick", this.grd_detail_oncellclick, this);
            this.btn_Confirm.addEventHandler("onclick", this.btn_Confirm_onclick, this);
            this.btn_Cancel.addEventHandler("onclick", this.btn_Cancel_onclick, this);
            this.grd_list.addEventHandler("oncellclick", this.grd_list_oncellclick, this);
            this.grd_list.addEventHandler("onselectchanged", this.grd_list_oncellclick, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.btn_Refund.addEventHandler("onclick", this.btn_Refund_onclick, this);

        };

        this.loadIncludeScript("RTREPrePayment_tab1.xfdl");

       
    };
}
)();
