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
                this.set_name("RTREBondCollection");
                this.set_classname("test_form");
                this.set_titletext("채권추심 관리");
                this._setFormPosition(0,0,1147,496);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list01", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ramgYm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ramgStat\" type=\"STRING\" size=\"256\"/><Column id=\"ramgStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"ramgAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rmonAmt\" type=\"STRING\" size=\"256\"/><Column id=\"ramgreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arrereAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rmonreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"ovinAmt\" type=\"STRING\" size=\"256\"/><Column id=\"ovinreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"ramgId\" type=\"STRING\" size=\"256\"/><Column id=\"ramgIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordCnt\" type=\"STRING\" size=\"256\"/><Column id=\"fstDelYm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R035", this);
            obj.set_firefirstcount("0");
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
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list02", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ramgYm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ramgStat\" type=\"STRING\" size=\"256\"/><Column id=\"ramgStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"ramgAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rmonAmt\" type=\"STRING\" size=\"256\"/><Column id=\"ramgreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arrereAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rmonreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"ovinAmt\" type=\"STRING\" size=\"256\"/><Column id=\"ovinreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"ramgId\" type=\"STRING\" size=\"256\"/><Column id=\"ramgIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"fstDelYm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list03", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ramgSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"ramgYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntctDay\" type=\"STRING\" size=\"256\"/><Column id=\"cntctGb\" type=\"STRING\" size=\"256\"/><Column id=\"cntctGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntctDesc\" type=\"STRING\" size=\"256\"/><Column id=\"attchFlSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_copy", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ramgSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"ramgYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntctDay\" type=\"STRING\" size=\"256\"/><Column id=\"cntctGb\" type=\"STRING\" size=\"256\"/><Column id=\"cntctGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntctDesc\" type=\"STRING\" size=\"256\"/><Column id=\"attchFlSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list01", "absolute", "0", "124", "520", "370", null, null, this);
            obj.set_taborder("1");
            obj.set_autosizingtype("none");
            obj.set_binddataset("ds_list01");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\" band=\"left\"/><Column size=\"100\" band=\"left\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"고객번호\"/><Cell col=\"1\" text=\"고객명\"/><Cell col=\"2\" text=\"관리등급명\"/><Cell col=\"3\" text=\"관리금액\"/><Cell col=\"4\" text=\"연체금액\"/><Cell col=\"5\" text=\"당월청구금액\"/><Cell col=\"6\" text=\"채권관리&#13;&#10;수납금액\"/><Cell col=\"7\" text=\"연체수납금액\"/><Cell col=\"8\" text=\"당월청구&#13;&#10;수납금액\"/><Cell col=\"9\" text=\"계약건수\"/><Cell col=\"10\" text=\"연체시작월\"/></Band><Band id=\"body\"><Cell style=\"cursor: ;\" text=\"bind:custNo\"/><Cell col=\"1\" style=\"cursor: ;\" text=\"bind:custNm\"/><Cell col=\"2\" style=\"cursor: ;\" text=\"bind:ramgStatNm\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;cursor: ;\" text=\"bind:ramgAmt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;cursor: ;\" text=\"bind:arreAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:rmonAmt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:ramgreAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:arrereAmt\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:rmonreAmt\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:ordCnt\" mask=\"###,###,###,##0\"/><Cell col=\"10\" style=\"cursor: ;\" text=\"bind:fstDelYm\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\"/><Cell col=\"2\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list01.getSum(&quot;ramgAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list01.getSum(&quot;arreAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list01.getSum(&quot;rmonAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list01.getSum(&quot;ramgreAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list01.getSum(&quot;arrereAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list01.getSum(&quot;rmonreAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list01.getSum(&quot;ordCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"10\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "83", "1122", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "99", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "114", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "82", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("12");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static45", "absolute", "125", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static46", "absolute", "130", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", null, "12", "431", null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "33", "20", "45", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "346", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "346", "32", "30", "44", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "376", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "376", "45", "95", "20", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_text("채권관리등급");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNo", "absolute", "476", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNoKeyword", "absolute", "621", "12", "160", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_RamgStat", "absolute", "475", "45", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_text("전체");
            obj.set_innerdataset("@ds_R035");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");
            obj = new Button("btn_custPopUp", "absolute", "595", "11", "20", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("대상년월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtYear", "absolute", "131", "12", "60", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition06", "absolute", "195", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("년");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtMonth", "absolute", "221", "12", "40", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("2");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition07", "absolute", "265", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("월");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grd_list02", "absolute", "544", "124", "577", "160", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_list02");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\" band=\"left\"/><Column size=\"100\" band=\"left\"/><Column size=\"100\" band=\"left\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"고객번호\"/><Cell col=\"1\" text=\"고객명\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"관리등급명\"/><Cell col=\"4\" text=\"관리금액\"/><Cell col=\"5\" text=\"연체금액\"/><Cell col=\"6\" text=\"당월청구금액\"/><Cell col=\"7\" text=\"채권관리&#13;&#10;수납금액\"/><Cell col=\"8\" text=\"연체수납금액\"/><Cell col=\"9\" text=\"당월청구&#13;&#10;수납금액\"/><Cell col=\"10\" text=\"연체시작월\"/></Band><Band id=\"body\"><Cell style=\"cursor: ;\" text=\"bind:custNo\"/><Cell col=\"1\" style=\"cursor: ;\" text=\"bind:custNm\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" style=\"cursor: ;\" text=\"bind:ordNo\"/><Cell col=\"3\" style=\"cursor: ;\" text=\"bind:ramgStatNm\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:ramgAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:arreAmt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:rmonAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:ramgreAmt\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:arrereAmt\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:rmonreAmt\" mask=\"###,###,###,##0\"/><Cell col=\"10\" style=\"align: ;\" text=\"bind:fstDelYm\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list02.getSum(&quot;ramgAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list02.getSum(&quot;arreAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list02.getSum(&quot;rmonAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list02.getSum(&quot;ramgreAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list02.getSum(&quot;arrereAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list02.getSum(&quot;rmonreAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"10\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "544", "99", "81", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("계약별 내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list03", "absolute", "544", "334", "577", "160", null, null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_list03");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"376\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"컨택등록일\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"채권관리내용\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" style=\"cursor:hand;\" text=\"bind:cntctDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" style=\"align: ;cursor:hand;\" text=\"bind:ordNo\"/><Cell col=\"2\" style=\"align:left middle;cursor:hand;\" text=\"bind:cntctDesc\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "544", "309", "120", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("채권 컨택 내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Confirm", "absolute", "975", "307", "97", "22", null, null, this);
            obj.set_taborder("3");
            obj.set_text("컨택내역 등록");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "477", "97", "45", "22", null, null, this);
            obj.set_taborder("22");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "1077", "97", "45", "22", null, null, this);
            obj.set_taborder("23");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "1077", "307", "45", "22", null, null, this);
            obj.set_taborder("24");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 82, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("채권추심 관리");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item16","div_search.edtYear","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_search.edtMonth","value","ds_chgInfo","expireM");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREBondCollection.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREBondCollection.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 채권관리 > 채권추심관리 등록
         * 02. 그룹명   : RTREBondCollection.xfdl
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
        	this.toDay		= ""; 	//당일
        	this.yesterDay	= ""; 	//전일
        	this.curMonth 	= "";	//당월	
        	this.prevMonth	= ""; 	//전월
        	this.nextMonth	= ""; 	//익월
        	this.saveFlag	= "";   //저장구분(I:등록,U:수정)
        	this.saveDate	= "";	//등록일자
        	this.custNo		= "";   //고객번호
        	this.ordNo		= "";	//계약번호
        	this.btnFlag	= true;	//팝업버튼 활성화FLAG
        	this.ramgYm		= "";   //채권관리년월
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
        		//월일 조회
        		this.fn_getDayMongth();	
        		//공통코드조회
        		this.fn_getCommCode();			
        		//버튼초기화		
        		this.fn_initBtn();	
        		
        		var auth = Ex.core.o_auth;
        		if( auth.exptAuthYn == "N" ){
        			this.Button00.set_enable(false);
        			this.Button01.set_enable(false);
        			this.Button02.set_enable(false);
        		}
        	}		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
         	//---------------------------------------------------------------------------------
        	// 공통코드 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getCommCode  = function() {
        		var sSvcID      	= "getCommCode";  
        		var sController   	= "ntrms/re/getBondMngCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_R035=outputR035";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}	
            //-------------------------------------------------------------------------------  	
        	//월일 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getDayMongth = function() 
        	{
        		var sSvcID      	= "getDayMongth";  
        		var sController   	= "ntrms/re/getDayMongth.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}	
         	//---------------------------------------------------------------------------------
        	// 채권계정 내역 조회
        	//---------------------------------------------------------------------------------		
        	this.fn_search = function()
        	{
        		this.ds_list01.clearData();
        		this.ds_list02.clearData();		
        		this.ds_list03.clearData();		
        		this.grd_list02.set_binddataset("");
        		this.grd_list03.set_binddataset("");				
        		this.grd_list01.set_nodatatext("");	
        		this.grd_list02.set_nodatatext("");	
        		this.grd_list03.set_nodatatext("");						
        		this.ramgYm = nvl(this.div_search.edtYear.value) + "" + nvl(this.div_search.edtMonth.value);
        		
        		if(nvl(this.div_search.edtYear.value) == "") {
        			alert('대상년월을 입력하세요.');
        			this.div_search.edtYear.setFocus();
        			return;
        		}
        		if(nvl(this.div_search.edtMonth.value) == "") {
        			alert('대상년월을 입력하세요.');
        			this.div_search.edtMonth.setFocus();
        			return;
        		}	
        			
        		if(!this.fn_chkYm(this.div_search.edtYear.value, this.div_search.edtMonth.value))
        		{
        			return;
        		}	
        			
        		var sSvcID      	= "getBondList";  
        		var sController   	= "ntrms/re/getBondList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list01=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        								
        		sArgs += Ex.util.setParam("ramgYm"		, this.ramgYm);									//채권관리년월
        		sArgs += Ex.util.setParam("custNo"	    , nvl(this.div_search.edt_custNo.value));		//고객번호
        		sArgs += Ex.util.setParam("ramgStat"	, nvl(this.div_search.cbo_RamgStat.value));		//채권계정등급	

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        	
         	//---------------------------------------------------------------------------------
        	// 계약별 내역 조회
        	//---------------------------------------------------------------------------------		
        	this.fn_getBondByOrdList = function()
        	{
        		this.grd_list02.set_nodatatext("");		
        		this.ds_list02.clearData();	
        		var sSvcID      	= "getBondByOrdList";  
        		var sController   	= "ntrms/re/getBondByOrdList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list02=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        								
        		sArgs += Ex.util.setParam("ramgYm"	, nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ramgYm")));	//채권관리년월
        		sArgs += Ex.util.setParam("custNo"	, nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"custNo")));	//고객번호

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}	
        	
         	//---------------------------------------------------------------------------------
        	// 채권컨택내역 조회
        	//---------------------------------------------------------------------------------		
        	this.fn_getContactList = function()
        	{
        		this.grd_list03.set_nodatatext("");		
        		this.ds_list03.clearData();	
        		
        		var sSvcID      	= "getContactList";  
        		var sController   	= "ntrms/re/getContactList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list03=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        							
        		sArgs += Ex.util.setParam("ramgYm"	, nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ramgYm")));	//채권관리년월
        		sArgs += Ex.util.setParam("custNo"	, nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"custNo")));	//고객번호
        		sArgs += Ex.util.setParam("ordNo"	, nvl(this.ds_list02.getColumn(this.ds_list02.rowposition,"ordNo")));	//계약번호
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
        			//월일 조회
        			case "getDayMongth":
        				this.div_search.edtYear.set_value(this.curMonth.substr(0,4));
        				this.div_search.edtMonth.set_value(this.curMonth.substr(4,2));	
        				//버튼 활성화처리
        				this.fn_btnAble();							
        				break;	
        			//공통코드 조회					
        			case "getCommCode":
        				var nRow = this.ds_R035.insertRow(0);
        				this.ds_R035.setColumn(nRow,"cd","");
        				this.ds_R035.setColumn(nRow,"cdNm","전체");	
        				this.div_search.cbo_RamgStat.set_index(0);
        				break;	
        			//채권계정내역 조회				
        			case "getBondList":		
        				//			
        				if(this.ds_list01.rowcount == 0) {
        					this.grd_list01.set_nodatatext("조회된 결과가 없습니다.");
        				}
        				if(this.ds_list01.rowcount > 0) {
        					this.ds_list01.set_rowposition(0);
        					var pos = this.ds_list01.rowposition;	
        					this.ds_copy.clearData();
        					var row = this.ds_copy.addRow();
        					this.ds_copy.copyRow(row, this.ds_list01, pos);			

        					//this.ramgYm = nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ramgYm"));
        					//계약별 내역조회
        					//this.fn_getBondByOrdList();
        				}
        				this.fn_btnAble();
        				break;	
        			//계약별내역 조회				
        			case "getBondByOrdList":		
        				this.ds_list02.set_rowposition(-1);					
        				if(this.ds_list02.rowcount == 0) {
        					this.grd_list02.set_nodatatext("조회된 결과가 없습니다.");
        				}
        				if(this.ds_list02.rowcount > 0) {
        					this.grd_list02.set_binddataset(this.ds_list02);				
        					//채권컨택내역조회
        					//this.fn_getContactList();
        					var pos = this.ds_list01.rowposition;	
        					this.ds_copy.clearData();
        					var row = this.ds_copy.addRow();
        					this.ds_copy.copyRow(row, this.ds_list01, pos);							
        				}
        				break;
        			//채권컨택내역 조회				
        			case "getContactList":		
        				this.ds_list03.set_rowposition(-1);					
        				if(this.ds_list03.rowcount == 0) {
        					this.grd_list03.set_nodatatext("조회된 결과가 없습니다.");
        				}
        				if(this.ds_list03.rowcount > 0) {
        					this.grd_list03.set_binddataset(this.ds_list03);	
        				}	
        				break;				
        			//고객정보 조회				
        			case "listCustInfo":
        				if(this.ds_cust.rowcount > 0 ) {
        					this.div_search.edt_custNoKeyword.set_value(this.ds_cust.getColumn(0, "custNm"));
        				}	
        				break;								
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	// 대상년월 변경 이벤트
            //-------------------------------------------------------------------------------  	
        	this.cal_accReqDate_onchanged = function(obj,e)
        	{
        		if(nvl(this.div_search.edtMonth.value) != "" && obj.getLength() == 1) {
        			if(parseInt(this.div_search.edtMonth.value,10) < 10) {
        				this.div_search.edtMonth.set_value("0" + obj.value);
        			}
        		}	
        		
        		this.ramgYm = nvl(this.div_search.edtYear.value) + "" + nvl(this.div_search.edtMonth.value);

        		if(this.ramgYm != "") {
        			if(this.ramgYm.length == 6) {
        				if(!this.fn_chkYm(this.div_search.edtYear.value, this.div_search.edtMonth.value))
        				{
        					return;
        				}
        				else {
        					//버튼 활성화처리
        					//this.fn_btnAble();
        				}
        			}
        			else {
        				var nYear = nvl(this.div_search.edtYear.value)
        				var nMonth = nvl(this.div_search.edtMonth.value);
        				if(nYear.length < 4) {
        					alert('대상년월을 입력하세요.');
        					this.div_search.edtYear.setFocus();
        					return false;
        				}
        				if(nMonth.length < 2) {
        					alert('대상년월을 입력하세요.');
        					this.div_search.edtMonth.setFocus();
        					return false;
        				}				
        			}
        		}
        	}		
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
        	//채권계정내역 클릭시 이벤트
        	//------------------------------------------------------------------------------
        	this.grd_list01_oncellclick = function(obj,e)
        	{
        		this.grd_list02.set_binddataset("");
        		this.grd_list03.set_binddataset("");
        		var pos = this.ds_list01.rowposition;	
        		this.ds_copy.clearData();
        		var row = this.ds_copy.addRow();
        		this.ds_copy.copyRow(row, this.ds_list01, pos);
        		this.ramgYm = nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ramgYm"));
        		//계약별 내역조회
        		this.fn_getBondByOrdList();
        		//채권컨택내역 조회
        		this.fn_getContactList();			
        	}
        	//------------------------------------------------------------------------------
        	//계약별내역 클릭시 이벤트
        	//------------------------------------------------------------------------------	
        	this.grd_list02_oncellclick = function(obj,e)
        	{
        		this.grd_list03.set_binddataset("");
        		var pos = this.ds_list02.rowposition;		
        		this.ds_copy.clearData();
        		var row = this.ds_copy.addRow();
        		this.ds_copy.copyRow(row, this.ds_list02, pos);	
        		
        		this.ramgYm = nvl(this.ds_list02.getColumn(this.ds_list02.rowposition,"ramgYm"));	
        		//채권컨택내역 조회
        		this.fn_getContactList();		
        	}
        	//------------------------------------------------------------------------------
        	//채권컨택내역 더블 클릭시 이벤트
        	//------------------------------------------------------------------------------	
        	this.grd_list03_oncelldblclick = function(obj,e)
        	{
        		this.saveFlag = "U";	
        		//this.saveDate = this.ds_list03.getColumn(this.ds_list03.rowposition,"cntctDay");	//컨택등록일
        		this.fn_regPopUp();
        	}	
            //-------------------------------------------------------------------------------  
        	//컨택내역등록 버튼 클릭
            //-------------------------------------------------------------------------------  		
        	this.btn_Confirm_onclick = function(obj,e)
        	{
        		this.saveFlag = "I";
        		this.fn_regPopUp();
        	}		
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//채권추심관리내역등록 팝업창
            //-------------------------------------------------------------------------------  	
        	this.fn_regPopUp = function(obj,e)
        	{
        		if(this.saveFlag == "U") {
        			var pos = this.ds_list03.rowposition;
        			this.ds_copy.clearData();
        			this.ds_copy.addColumn("string","custNm",256);			
        			var row = this.ds_copy.addRow();
        			this.ds_copy.copyRow(row, this.ds_list03, pos);
        		}

        		if(this.saveFlag == "I") {
        			var pos = this.ds_list01.rowposition;	
        			this.ds_copy.clearData();
        			var row = this.ds_copy.addRow();
        			this.ds_copy.copyRow(row, this.ds_list01, pos);
        			this.ramgYm = nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"ramgYm"));		
        			this.ds_copy.setColumn(row,"cntctDay", this.toDay);
        		}

        		var args ={p_formId:this.id, p_arg:this.ds_copy, p_saveFlag:this.saveFlag, p_btnFlag:this.btnFlag};
        		Ex.core.popup(this,"채권추심관리내역 등록","re::RTREContact_pop.xfdl",args, "modaless=false");
        	}	
            //-------------------------------------------------------------------------------   
            // 대상년월에 따른 버튼 활성화처리  
            //-------------------------------------------------------------------------------   	
        	this.fn_btnAble = function() {
        		//대상년월이 당월이면 컨택내역등록버튼 활성화
        		if(this.ds_list01.rowcount > 0) {
        			if(this.curMonth == this.ramgYm) {
        				this.btn_Confirm.set_enable(true);
        				this.btnFlag = true;
        			}
        			else {
        				this.btn_Confirm.set_enable(false);	
        				this.btnFlag = false;
        			}
        		}
        		else {
        			this.btn_Confirm.set_enable(false);	
        			this.btnFlag = false;		
        		}
        	}
            //-------------------------------------------------------------------------------   
            // 존재하는 날자(유효한 날자) 인지 체크   
            //-------------------------------------------------------------------------------   
            this.fn_chkYm = function(nYear,nMonth) 
            {
        		if(nYear.length < 4) {
        			alert('대상년월을 입력하세요.');
        			this.div_search.edtYear.setFocus();
        			return false;
        		}
        		if(nMonth.length < 2) {
        			alert('대상년월을 입력하세요.');
        			this.div_search.edtMonth.setFocus();
        			return false;
        		}	
        		    
        		if (nYear < 1900 || nYear > 3000)   
        		{ 
        			this.alert("사용할수 없는 대상년월이 입력되었습니다.");
        			this.div_search.edtYear.setFocus();			
        			return false;
        		}   
        	  
        		if (nMonth < 1 || nMonth > 12)   
        		{  
        			this.alert("사용할수 없는 대상년월이 입력되었습니다.");
        			this.div_search.edtMonth.setFocus();			
        			return false;		
        		}      
        		return true;
            }	
            //-------------------------------------------------------------------------------  	
        	//고객명 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCustNm = function() {
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
        	//고객번호 팝업창
            //-------------------------------------------------------------------------------  	
        	this.fn_custPopUp = function(obj,e)
        	{
        		var args ={p_formId:this.id, p_custNo:nvl(this.div_search.edt_custNo.value), p_custNm:nvl(this.div_search.edt_custNoKeyword.value)};
        		Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
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
        		this.parent.setButton("S",this);		
        	}
        	
            //-------------------------------------------------------------------------------  	
        	//팝업종료후 채권컨택내역 재조회실행
            //-------------------------------------------------------------------------------  	
        	this.returnRegPopInfo = function(val) {
        		this.fn_getContactList();
        	}
        	
        	this.Button00_onclick = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grd_list01);
        	}

        	this.Button01_onclick = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grd_list02);
        	}

        	this.Button02_onclick = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grd_list03);
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.grd_list01.addEventHandler("onselectchanged", this.grd_list01_oncellclick, this);
            this.grd_list01.addEventHandler("oncellclick", this.grd_list01_oncellclick, this);
            this.div_search.edt_custNo.addEventHandler("onkeyup", this.custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.edtYear.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.edtMonth.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.grd_list02.addEventHandler("oncellclick", this.grd_list02_oncellclick, this);
            this.grd_list02.addEventHandler("onselectchanged", this.grd_list02_oncellclick, this);
            this.grd_list03.addEventHandler("oncelldblclick", this.grd_list03_oncelldblclick, this);
            this.btn_Confirm.addEventHandler("onclick", this.btn_Confirm_onclick, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);

        };

        this.loadIncludeScript("RTREBondCollection.xfdl");

       
    };
}
)();
