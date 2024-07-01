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
                this.set_name("RTCSRegularCheckContact");
                this.set_classname("RTCSRegularCheckContact");
                this.set_titletext("정기점검 컨택관리");
                this._setFormPosition(0,0,1147,544);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_C027", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C028", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C027_cond", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C028_cond", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list_main", this);
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"mrCd\" type=\"STRING\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"poscd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr1Old\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"callCnt\" type=\"STRING\" size=\"256\"/><Column id=\"obSt\" type=\"STRING\" size=\"256\"/><Column id=\"obStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"mrMemo\" type=\"STRING\" size=\"256\"/><Column id=\"apprScnt\" type=\"STRING\" size=\"256\"/><Column id=\"targetNm\" type=\"STRING\" size=\"256\"/><Column id=\"chkStat\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay2\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo2\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_CS0005", this);
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"mrCd\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"obSt\" type=\"STRING\" size=\"256\"/><Column id=\"obStDtl\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_CS0006", this);
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"mrCd\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"poscd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chg", this);
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"poscd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"mrCd\" type=\"STRING\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"obSt\" type=\"STRING\" size=\"256\"/><Column id=\"obStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mr", this);
            obj._setContents("<ColumnInfo><Column id=\"carmasterNu\" type=\"STRING\" size=\"256\"/><Column id=\"carmasterNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contactExcel", this);
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr1Old\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"obSt\" type=\"STRING\" size=\"256\"/><Column id=\"obStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"callCnt\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"chkStat\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay2\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"targetNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_H008", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_H008_cond", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tmp", this);
            obj._setContents("<ColumnInfo><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_contractInfo", "absolute", "0", "83", "80", "21", null, null, this);
            obj.set_taborder("0");
            obj.set_text("고객정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_workList", "absolute", "0", "109", "1122", "239", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_list_main");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"64\"/><Column size=\"75\"/><Column size=\"94\"/><Column size=\"66\"/><Column size=\"64\"/><Column size=\"73\"/><Column size=\"71\"/><Column size=\"67\"/><Column size=\"65\"/><Column size=\"62\"/><Column size=\"69\"/><Column size=\"100\"/><Column size=\"150\"/><Column size=\"37\"/><Column size=\"85\"/><Column size=\"83\"/><Column size=\"145\"/><Column size=\"143\"/><Column size=\"114\"/><Column size=\"85\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"로디안\"/><Cell col=\"1\" text=\"예정일\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"배정구분\"/><Cell col=\"4\" text=\"처리상태\"/><Cell col=\"5\" text=\"처리일\"/><Cell col=\"6\" text=\"장착일\"/><Cell col=\"7\" text=\"서비스횟수\"/><Cell col=\"8\" text=\"잔여횟수\"/><Cell col=\"9\" text=\"고객명\"/><Cell col=\"10\" text=\"차량번호\"/><Cell col=\"11\" text=\"차종\"/><Cell col=\"12\" text=\"상품명\"/><Cell col=\"13\" text=\"본수\"/><Cell col=\"14\" text=\"핸드폰\"/><Cell col=\"15\" text=\"전화번호\"/><Cell col=\"16\" text=\"주소\"/><Cell col=\"17\" text=\"구주소\"/><Cell col=\"18\" text=\"상세주소\"/><Cell col=\"19\" text=\"로디안연락처\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:userNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:planDay\" maskchar=\" \"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" maskchar=\"_\"/><Cell col=\"3\" text=\"bind:targetNm\"/><Cell col=\"4\" text=\"bind:chkStat\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" text=\"bind:procDay\" mask=\"expr:comp.parent.ds_list_main.getColumn(currow, 'procDay') == null ? '' : '####-##-##'\"/><Cell col=\"6\" text=\"bind:procDay2\" mask=\"expr:comp.parent.ds_list_main.getColumn(currow, 'procDay2') == null ? '' : '####-##-##'\"/><Cell col=\"7\" text=\"bind:servCnt\"/><Cell col=\"8\" text=\"bind:servCntr\"/><Cell col=\"9\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:custNm\" maskchar=\" \"/><Cell col=\"10\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:carNo\"/><Cell col=\"11\" text=\"bind:modelNm\"/><Cell col=\"12\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:matNm\"/><Cell col=\"13\" displaytype=\"normal\" edittype=\"none\" text=\"bind:cntNm\"/><Cell col=\"14\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:mobNo\"/><Cell col=\"15\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:telNo\"/><Cell col=\"16\" displaytype=\"text\" edittype=\"readonly\" style=\"align:left;\" text=\"bind:addr1\"/><Cell col=\"17\" style=\"align:left;\" text=\"bind:addr1Old\"/><Cell col=\"18\" displaytype=\"text\" edittype=\"readonly\" style=\"align:left;\" text=\"bind:addr2\"/><Cell col=\"19\" text=\"bind:mobNo2\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "78", null, null, this);
            obj.set_taborder("3");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "256", "12", "56", "21", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_text("배정월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "24", "12", "54", "21", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_text("로디안");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("mrCd", "absolute", "84", "12", "48", "21", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_enable("false");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save01", "absolute", "130", "12", "21", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("sdYm", "absolute", "318", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj = new Edit("mrNm", "absolute", "151", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_enable("false");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "64", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "32", "1122", "12", null, null, this.div_search);
            obj.set_taborder("109");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "231", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("110");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "438", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("111");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm01", "absolute", "463", "12", "68", "21", null, null, this.div_search);
            obj.set_taborder("112");
            obj.set_text("광역시도");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_doNm", "absolute", "535", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("3");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm00", "absolute", "681", "12", "68", "21", null, null, this.div_search);
            obj.set_taborder("114");
            obj.set_text("시군구");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ctNm", "absolute", "743", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("4");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "654", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("116");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm02", "absolute", "231", "44", "52", "21", null, null, this.div_search);
            obj.set_taborder("117");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "290", "44", "98", "21", null, null, this.div_search);
            obj.set_taborder("5");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "64", "1122", "12", null, null, this.div_search);
            obj.set_taborder("119");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm03", "absolute", "415", "44", "52", "21", null, null, this.div_search);
            obj.set_taborder("120");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "476", "44", "97", "21", null, null, this.div_search);
            obj.set_taborder("6");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "764", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("122");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_obSt", "absolute", "669", "44", "81", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_innerdataset("@ds_C027_cond");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("6");
            obj = new Combo("cmb_obStDtl", "absolute", "756", "44", "144", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("8");
            obj.set_innerdataset("@ds_C028_cond");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("st_date", "absolute", "923", "44", "80", "21", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("예정일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_planDay", "absolute", "986", "43", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("9");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_custNm04", "absolute", "597", "44", "71", "21", null, null, this.div_search);
            obj.set_taborder("123");
            obj.set_text("컨택상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_chkStat", "absolute", "888", "12", "71", "21", null, null, this.div_search);
            obj.set_taborder("124");
            obj.set_text("처리상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_chkStat", "absolute", "960", "12", "105", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("125");
            obj.set_innerdataset("@ds_H008_cond");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("6");
            obj = new Static("Static06", "absolute", "863", "8", "25", "36", null, null, this.div_search);
            obj.set_taborder("126");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm05", "absolute", "25", "44", "68", "21", null, null, this.div_search);
            obj.set_taborder("127");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "92", "44", "114", "21", null, null, this.div_search);
            obj.set_taborder("128");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "99", "1147", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_text("h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "358", "1147", "40", null, null, this);
            obj.set_taborder("5");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd", "absolute", "0", "358", "61", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd01", "absolute", "148", "358", "64", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("txt_telNo", "absolute", "211", "358", "100", "31", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd03", "absolute", "310", "358", "73", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("txt_poscd", "absolute", "382", "358", "100", "31", null, null, this);
            obj.set_taborder("11");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd05", "absolute", "481", "358", "49", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("txt_addr1", "absolute", "529", "358", "592", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "348", "1147", "10", null, null, this);
            obj.set_taborder("15");
            obj.set_text("h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "0", "399", "1121", "31", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "429", "1121", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "459", "1121", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1121", "0", "26", null, null, "-2", this);
            obj.set_taborder("19");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd", "absolute", "0", "399", "80", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_text("우편번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("posCd", "absolute", "85", "404", "93", "21", null, null, this);
            obj.set_taborder("22");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("true");
            obj.set_readonly("true");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_addr1", "absolute", "184", "399", "80", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("addr1", "absolute", "269", "404", "266", "21", null, null, this);
            obj.set_taborder("24");
            obj.set_maxlength("100");
            obj.set_enable("true");
            obj.set_readonly("true");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Edit("addr2", "absolute", "537", "404", "291", "21", null, null, this);
            obj.set_taborder("25");
            obj.set_maxlength("160");
            obj.set_enable("true");
            obj.set_readonly("true");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Button("btn_postSearch1", "absolute", "157", "403", "20", "21", null, null, this);
            obj.set_taborder("26");
            obj.set_cssclass("btn_WF_edtSch");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_change_save", "absolute", "1074", "403", "40", "23", null, null, this);
            obj.set_taborder("27");
            obj.set_text("저장");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd03", "absolute", "0", "429", "80", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("예정일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd05", "absolute", "452", "429", "80", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_text("컨택상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd06", "absolute", "833", "429", "80", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("변경일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Calendar("planDaya", "absolute", "85", "434", "93", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");

            obj = new Calendar("planDay", "absolute", "919", "434", "98", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("41");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new MaskEdit("planTm", "absolute", "1022", "434", "45", "21", null, null, this);
            obj.set_taborder("43");
            obj.set_type("string");
            obj.set_mask("@@:@@");
            obj.set_maskchar(" ");
            obj.style.set_color("black");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("txt_hpNo", "absolute", "60", "358", "89", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd04", "absolute", "184", "429", "80", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("연체횟수");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd08", "absolute", "833", "399", "80", "31", null, null, this);
            obj.set_taborder("48");
            obj.set_text("로디안");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mrCd", "absolute", "919", "404", "44", "21", null, null, this);
            obj.set_taborder("49");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.set_maxlength("6");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_apprScnt", "absolute", "269", "434", "43", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_obSt", "absolute", "537", "434", "105", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("51");
            obj.set_innerdataset("@ds_C027");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("true");

            obj = new Combo("cmb_obStDtl", "absolute", "647", "434", "181", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("52");
            obj.set_innerdataset("@ds_C028");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("true");

            obj = new Static("st_ordQty00", "absolute", "0", "459", "80", "31", null, null, this);
            obj.set_taborder("53");
            obj.set_text("배정구분");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mrMemo", "absolute", "693", "496", "339", "21", null, null, this);
            obj.set_taborder("54");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "78", "1147", "10", null, null, this);
            obj.set_taborder("55");
            obj.set_text("h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "389", "1147", "10", null, null, this);
            obj.set_taborder("56");
            obj.set_text("h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "65", "363", "79", "21", null, null, this);
            obj.set_taborder("57");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNo", "absolute", "216", "363", "90", "21", null, null, this);
            obj.set_taborder("58");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_telNo", "absolute", "387", "363", "90", "21", null, null, this);
            obj.set_taborder("59");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Edit("addr01", "absolute", "534", "363", "228", "21", null, null, this);
            obj.set_taborder("60");
            obj.set_maxlength("100");
            obj.set_enable("true");
            obj.set_readonly("true");
            obj.style.set_background("#f7f7f7ff");
            obj.style.set_padding("0 2 0 2");
            obj.style.set_font("8 Dotum");
            this.addChild(obj.name, obj);

            obj = new Edit("addr02", "absolute", "886", "363", "230", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_maxlength("160");
            obj.set_enable("true");
            obj.set_readonly("true");
            obj.style.set_background("#f7f7f7ff");
            obj.style.set_padding("0 2 0 2");
            obj.style.set_font("8 Dotum");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_bldMngNo", "absolute", "211", "496", null, "21", "836", null, this);
            obj.set_taborder("62");
            obj.set_maxlength("160");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mrNm", "absolute", "967", "404", "100", "21", null, null, this);
            obj.set_taborder("63");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.set_maxlength("6");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_exel", "absolute", "74.89%", "91", null, "141", "6.54%", null, this);
            obj.set_taborder("64");
            obj.set_binddataset("ds_contactExcel");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"77\"/><Column size=\"82\"/><Column size=\"79\"/><Column size=\"66\"/><Column size=\"61\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"96\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"82\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"담당자\"/><Cell col=\"1\" text=\"예정일\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"배정구분\"/><Cell col=\"4\" text=\"처리상태\"/><Cell col=\"5\" text=\"처리일\"/><Cell col=\"6\" text=\"장착일\"/><Cell col=\"7\" text=\"서비스횟수\"/><Cell col=\"8\" text=\"잔여횟수\"/><Cell col=\"9\" text=\"고객명\"/><Cell col=\"10\" text=\"차량번호\"/><Cell col=\"11\" text=\"차종\"/><Cell col=\"12\" text=\"상품명\"/><Cell col=\"13\" text=\"본수\"/><Cell col=\"14\" text=\"핸드폰\"/><Cell col=\"15\" text=\"전화번호\"/><Cell col=\"16\" text=\"주소\"/><Cell col=\"17\" text=\"구주소\"/><Cell col=\"18\" text=\"상세주소\"/><Cell col=\"19\" text=\"상태\"/><Cell col=\"20\" text=\"세부상태\"/><Cell col=\"21\" text=\"컨택횟수\"/><Cell col=\"22\" text=\"상담일자\"/><Cell col=\"23\" text=\"상담내용\"/><Cell col=\"24\" text=\"등록자\"/></Band><Band id=\"body\"><Cell text=\"bind:userNm\"/><Cell col=\"1\" text=\"bind:planDay\"/><Cell col=\"2\" text=\"bind:ordNo\"/><Cell col=\"3\" text=\"bind:targetNm\"/><Cell col=\"4\" style=\"align:center;\" text=\"bind:chkStat\"/><Cell col=\"5\" text=\"bind:procDay\" mask=\"expr:comp.parent.ds_contactExcel.getColumn(currow, 'procDay') == null ? '' : '####-##-##'\"/><Cell col=\"6\" text=\"bind:procDay2\" mask=\"expr:comp.parent.ds_contactExcel.getColumn(currow, 'procDay2') == null ? '' : '####-##-##'\"/><Cell col=\"7\" text=\"bind:servCnt\"/><Cell col=\"8\" text=\"bind:servCntr\"/><Cell col=\"9\" text=\"bind:custNm\"/><Cell col=\"10\" text=\"bind:carNo\"/><Cell col=\"11\" text=\"bind:modelNm\"/><Cell col=\"12\" text=\"bind:matNm\"/><Cell col=\"13\" text=\"bind:cntNm\"/><Cell col=\"14\" text=\"bind:mobNo\"/><Cell col=\"15\" text=\"bind:telNo\"/><Cell col=\"16\" text=\"bind:addr1\"/><Cell col=\"17\" style=\"align:left;\" text=\"bind:addr1Old\"/><Cell col=\"18\" text=\"bind:addr2\"/><Cell col=\"19\" text=\"bind:obSt\"/><Cell col=\"20\" text=\"bind:obStDtl\"/><Cell col=\"21\" text=\"bind:callCnt\"/><Cell col=\"22\" text=\"bind:callDay\"/><Cell col=\"23\" text=\"bind:callDtl\"/><Cell col=\"24\" text=\"bind:regId\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_callCnt", "absolute", "403", "434", "43", "21", null, null, this);
            obj.set_taborder("65");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd00", "absolute", "318", "429", "80", "31", null, null, this);
            obj.set_taborder("66");
            obj.set_text("컨택횟수");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Button("btn_mrSchd", "absolute", "1074", "433", "40", "23", null, null, this);
            obj.set_taborder("67");
            obj.set_text("일정");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordQty01", "absolute", "608", "491", "80", "31", null, null, this);
            obj.set_taborder("68");
            obj.set_text("전달사항");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordQty02", "absolute", "184", "459", "80", "31", null, null, this);
            obj.set_taborder("69");
            obj.set_text("처리상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_targetNm", "absolute", "85", "464", "93", "21", null, null, this);
            obj.set_taborder("70");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_chkStat", "absolute", "269", "464", "93", "21", null, null, this);
            obj.set_taborder("71");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_procDay", "absolute", "368", "459", "80", "31", null, null, this);
            obj.set_taborder("72");
            obj.set_text("처리일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Calendar("ed_procDay", "absolute", "453", "464", "93", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("73");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");

            obj = new Edit("addr01Old", "absolute", "766", "363", "116", "21", null, null, this);
            obj.set_taborder("74");
            obj.set_readonly("true");
            obj.set_maxlength("100");
            obj.style.set_background("#f7f7f7ff");
            obj.style.set_padding("0 2 0 2");
            obj.style.set_font("8 Dotum");
            this.addChild(obj.name, obj);

            obj = new Button("btn_deny", "absolute", "1042", "463", "72", "23", null, null, this);
            obj.set_taborder("75");
            obj.set_text("거부/철회");
            this.addChild(obj.name, obj);

            obj = new Static("st_procDay00", "absolute", "552", "459", "80", "31", null, null, this);
            obj.set_taborder("76");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_procDay01", "absolute", "732", "459", "80", "31", null, null, this);
            obj.set_taborder("77");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNoChg", "absolute", "637", "464", "90", "21", null, null, this);
            obj.set_taborder("78");
            obj.set_readonly("false");
            obj.set_maxlength("15");
            obj.style.set_background("#ffffffff");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_telNoChg", "absolute", "817", "464", "90", "21", null, null, this);
            obj.set_taborder("79");
            obj.set_readonly("false");
            obj.set_maxlength("15");
            obj.style.set_background("#ffffffff");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 78, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 544, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSRegularCheckContact");
            		p.set_titletext("정기점검 컨택관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","posCd","value","ds_chg","poscd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","addr1","value","ds_chg","addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","addr2","value","ds_chg","addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","planDaya","value","ds_list_main","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","planDay","value","ds_chg","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","planTm","value","ds_chg","planTm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","ed_mrCd","value","ds_chg","mrCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_apprScnt","value","ds_list_main","apprScnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","cmb_obSt","value","ds_chg","obSt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","cmb_obStDtl","value","ds_chg","obStDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_mrMemo","value","ds_list_main","mrMemo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_custNm","value","ds_list_main","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_telNo","value","ds_list_main","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","addr01","value","ds_list_main","addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","addr02","value","ds_list_main","addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_bldMngNo","value","ds_chg","bldMngNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","ed_mrNm","value","ds_chg","userNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","ed_callCnt","value","ds_list_main","callCnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","ed_targetNm","value","ds_list_main","targetNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ed_chkStat","value","ds_list_main","chkStat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","ed_procDay","value","ds_list_main","procDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","addr01Old","value","ds_list_main","addr1Old");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","ed_mobNoChg","value","ds_chg","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","ed_telNoChg","value","ds_chg","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_mobNo","value","ds_list_main","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegularCheckContact.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegularCheckContact.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSRegularCheckContact.xfdl
         * 설    명 : 정기점검 컨택관리
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-03-24	wjim		[20170324_02] 신규 개발
         * 2017-04-04	wjim		[20170404_01] 컨택상태 검증로직 추가
         * 2017-04-07	wjim		[20170406_01] 로디안 일정조회 기능 추가
         * 2017-06-02	wjim		[20170602_01] 엑셀항목에 '처리상태' 추가
         * 2017-06-05	wjim		[20170605_01] 조회항목에 '처리일' 추가
         * 2017-06-08	wjim		[20170608_01] 조회조건에 '처리상태' 추가
         * 2017-06-16	wjim		[20170616_01] '구주소' 추가
         * 2017-06-20	wjim		[20170612_01] SMS연동
         *							- 상담팝업으로 SMS관련항목 연동
         * 2017-06-20	wjim		[20170622_01] 로디안 정보조회 기준 변경
         *							- (변경전)이름으로 조회 > (변경후)사번으로 조회
         * 2017-07-27	wjim		[20170726_01] 거부철회 버튼 추가
         * 2017-12-15	wjim		[20171212_01] 조회조건 및 조회항목 추가
         *                          - 조회조건 : 계약번호
         *                          - 조회항목 : 장착일, 서비스횟수, 잔여횟수, 차종
         * 2017-12-20	wjim		[20171220_01] 핸드폰, 전화번호 수정기능 추가
         * 2017-12-22	wjim		[20171222_01] 핸드폰, 전화번호 하이픈 제거
         *                          - 연락처가 공란인 경우 조회되지 않는 문제 발생
         * 2018-03-22	wjim		[20180322_01] 엑셀항목에 '배정구분' 추가
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        // 전역변수
        this.toDay    = "";		// 서버기준 오늘날자
        this.fUserId  = "";		// 현재 로그인 사용자의 ID
        this.fUserGrp = "";		// 현재 로그인 사용자의 사용자그룹
        this.fAddr1   = "";		// 주소1

        this.fUserNm = "";      //사용자명

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTCSRegularCheckContact_onload = function(obj,e) {
        	Ex.core.init(obj);
        	// 상단 공통버튼 세팅 (조회, 엑셀)
        	this.parent.setButton("E|S", this);		
        	// 공통코드 조회
        	this.fn_getCommCode();
        	// 사용자정보 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        	this.fUserNm = application.gds_userInfo.getColumn(0, "userNm");

        	//로디안인 경우 로디안 정보 세팅
        	if(this.fUserGrp == "08"){
        		this.getRoadianInfo();
        	}
        	
        	// 조회조건-배정월 세팅 
        	this.fn_initYmd();
        }

        /**
         * 공통코드 조회
         */ 
        this.fn_getCommCode  = function() {
        	var sSvcID      	= "getCommCode";  
        	var sController   	= "/rtms/cs/commCodeRegularCheck.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_C027=ds_C027 ds_C028=ds_C028 ds_H008=ds_H008";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        /**
         * 서버기준 오늘 날자 조회
         */
        this.fn_initYmd = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /**
         * 로디안 찾기 버튼 클릭 이벤트 처리
         * - Mr.Rodian조회 화면이 팝업
         */
        this.div_cust_btn_postSearch1_onclick = function(obj,e) {
        	var args ={p_formId : "RTCSCarMaster"};
        	Ex.core.popup(this,"정기점검 컨택관리","cs::RTCSCarMaster_pop.xfdl",args, "modaless=false");
        }

        /**
         * 로디안 찾기 결과 처리
         * - Mr.Rodian조회 팝업화면에서 선택한 정보가 조회조건에 세팅
         */
        this.returnCarmaster = function(val1,val2){
        	this.div_search.mrCd.set_value(val1);
        	this.div_search.mrNm.set_value(val2);
        }

        /**
         * 상태 조회조건 콤보 값 변경 이벤트 처리
         */
        this.div_search_cmb_obSt_onitemchanged = function(obj,e) {
        	if (e.postvalue == "") {
        		this.ds_C028_cond.filter("cd == ''");
        	} else {
        		this.ds_C028_cond.filter("cd == '' || cd.substr(0,2) == '" + e.postvalue + "'");
        	}
        	
        	this.div_search.cmb_obStDtl.set_value("");
        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.fn_search = function() {

        	var mrCd = nvl(this.div_search.mrCd.value);
        	var stdYm = nvl(this.div_search.sdYm.value).substring(0, 6);
        	var ordNo = nvl(this.div_search.ed_ordNo.text);
        	
        	//[20191022_01] mrCd와 배정월은 조회조건에 꼭 필요함.
        	//조회조건 없이 조회하는 경우가 발생해 시스템 다운되는 현상 발생
        	//[20191030_01] 주문번호만 필수값을 변경 요청 - 영업관리자, 콜센터
        	if(this.fUserGrp == "01" || this.fUserGrp == "02"){
        	
        		//[20191031_01] 손경호 과장의 경우 전체 데이터 추출의 필요성으로 인해
        		//아침시간에 추출할 수 있도록 특정 아이디만 기능 제한
        		if(this.fUserId != "10092003"){
        			if(ordNo == ""){
        				this.alert("주문번호는 조회시 필수값입니다.");
        				return;
        			}	
        		}
        	}else {
        		if(stdYm == ""){
        			this.alert("배정월은 조회시 필수값입니다.");
        			return;
        		}	
        	}

        	
        	// 기존 조회결과 초기화
        	this.ds_list_main.deleteAll();
        	
        	var ls_sdYm         = nvl(this.div_search.sdYm.value);	
        	
        	var sSvcID        	= "listMain";                    
        	var sController   	= "/rtms/cs/selectCallList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list_main=ds_list_main";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("mrCd"   , this.div_search.mrCd.value       );
        	sArgs += Ex.util.setParam("stdYm"  , ls_sdYm.substring(0, 6)          );
        	sArgs += Ex.util.setParam("doNm"   , this.div_search.ed_doNm.text     );
        	sArgs += Ex.util.setParam("ctNm"   , this.div_search.ed_ctNm.text     );
        	sArgs += Ex.util.setParam("custNm" , this.div_search.ed_custNm.text   );
        	sArgs += Ex.util.setParam("mobNo"  , this.div_search.ed_mobNo.value   );
        	sArgs += Ex.util.setParam("obSt"   , this.div_search.cmb_obSt.value   );
        	sArgs += Ex.util.setParam("obStDtl", this.div_search.cmb_obStDtl.value);
        	sArgs += Ex.util.setParam("planDay", this.div_search.cal_planDay.value);
        	sArgs += Ex.util.setParam("chkStat", this.div_search.cmb_chkStat.value); //[20170608_01]
        	sArgs += Ex.util.setParam("ordNo"  , this.div_search.ed_ordNo.text    ); //[20171212_01]
        	
        	application.set_httptimeout(600);
        	 
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.fn_excel= function() {
        	var ls_sdYm         = nvl(this.div_search.sdYm.value);	
        	
        	var sSvcID        	= "listExcel";                    
        	var sController   	= "/rtms/cs/selectContactExcelList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_contactExcel=ds_contactExcel";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("mrCd"   , this.div_search.mrCd.value       );
        	sArgs += Ex.util.setParam("stdYm"  , ls_sdYm.substring(0, 6)          );
        	sArgs += Ex.util.setParam("doNm"   , this.div_search.ed_doNm.text     );
        	sArgs += Ex.util.setParam("ctNm"   , this.div_search.ed_ctNm.text     );
        	sArgs += Ex.util.setParam("custNm" , this.div_search.ed_custNm.text   );
        	sArgs += Ex.util.setParam("mobNo"  , this.div_search.ed_mobNo.value   );
        	sArgs += Ex.util.setParam("obSt"   , this.div_search.cmb_obSt.value   );
        	sArgs += Ex.util.setParam("obStDtl", this.div_search.cmb_obStDtl.value);
        	sArgs += Ex.util.setParam("planDay", this.div_search.cal_planDay.value);
        	sArgs += Ex.util.setParam("chkStat", this.div_search.cmb_chkStat.value); //[20170608_01]
        	sArgs += Ex.util.setParam("ordNo"  , this.div_search.ed_ordNo.text    ); //[20171212_01]
        		
        	application.set_httptimeout(600);
        	 
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        //	Ex.core.exportExcel(this, this.grd_workList);
        }

        /**
         * 목록 그리드의 Body 영역 셀 클릭 이벤트 처리
         */
        this.grd_workList_oncellclick = function(obj,e) {	
        	this.copyDS(e.row);	
        }

        /**
         * 목록정보 중 선택된 행의 데이터셋을 각각의 데이터셋으로 복사
         */	 
        this.copyDS = function(row) {
        	// 세부상테 필터링
        	this.ds_C028.filter("cd == '' || cd.substr(0,2) == '" + this.ds_list_main.getColumn(row, "obSt") + "'");
        	
        	// 데이터셋 초기화	
        	this.ds_chg.deleteAll();
        	//this.ds_tmp.deleteAll();	//변경전 연락처를 유지하기 위한 임시 데이터셋
        	
        	// 선택된 행의 데이터를 수정을 위한 별도의 데이터셋으로 복사
        	if ((this.ds_list_main.getRowCount() != 0) && (row >= 0)) {		
         		var idx  = this.ds_chg.addRow();
         		//var idx2 = this.ds_tmp.addRow();
         		
         		// 변경전 연락처를 유지하기 위한 임시 데이터셋
         		//this.ds_tmp.setColumn(idx2, "mobNo"   , FN_numberHyphenInReturn(this.ds_list_main.getColumn(row, "mobNo")));		//핸드폰   [20171220_01]
         		//this.ds_tmp.setColumn(idx2, "telNo"   , FN_numberHyphenInReturn(this.ds_list_main.getColumn(row, "telNo")));		//전화번호 [20171220_01]
        		
        		this.ds_chg.setColumn(idx, "stdYm"   , this.ds_list_main.getColumn(row, "stdYm"));
        		this.ds_chg.setColumn(idx, "ordNo"   , this.ds_list_main.getColumn(row, "ordNo"));
        		this.ds_chg.setColumn(idx, "equNo"   , this.ds_list_main.getColumn(row, "equNo"));
        		this.ds_chg.setColumn(idx, "jobSeq"  , this.ds_list_main.getColumn(row, "jobSeq"));
        		this.ds_chg.setColumn(idx, "seq"     , this.ds_list_main.getColumn(row, "seq"));
         		this.ds_chg.setColumn(idx, "bldMngNo", this.ds_list_main.getColumn(row, "bldMngNo"));
         		this.ds_chg.setColumn(idx, "poscd"   , this.ds_list_main.getColumn(row, "poscd"));
         		this.ds_chg.setColumn(idx, "addr1"   , this.ds_list_main.getColumn(row, "addr1"));
         		this.ds_chg.setColumn(idx, "addr2"   , this.ds_list_main.getColumn(row, "addr2"));				
        		this.ds_chg.setColumn(idx, "planDay" , this.ds_list_main.getColumn(row, "planDay"));
        		this.ds_chg.setColumn(idx, "planTm"  , this.ds_list_main.getColumn(row, "planTm"));
        		this.ds_chg.setColumn(idx, "mrCd"    , this.ds_list_main.getColumn(row, "mrCd"));
        		this.ds_chg.setColumn(idx, "userNm"  , this.ds_list_main.getColumn(row, "userNm"));
         		this.ds_chg.setColumn(idx, "obSt"    , this.ds_list_main.getColumn(row, "obSt"));
         		this.ds_chg.setColumn(idx, "obStDtl" , this.ds_list_main.getColumn(row, "obStDtl"));
         		this.ds_chg.setColumn(idx, "obSt"    , this.ds_list_main.getColumn(row, "obSt"));
         		this.ds_chg.setColumn(idx, "mobNo"   , this.ds_list_main.getColumn(row, "mobNo"));		//핸드폰   [20171220_01]
         		this.ds_chg.setColumn(idx, "telNo"   , this.ds_list_main.getColumn(row, "telNo"));		//전화번호 [20171220_01]
         		this.ds_chg.setColumn(idx, "chkStat" , this.ds_list_main.getColumn(row, "chkStat"));    //점검상태 [20180423]
         		this.ds_chg.setColumn(idx, "reqDesc" , "");    //특이사항 [20180423]
         		//this.ds_chg.setColumn(idx, "mobNo"   , FN_numberHyphenInReturn(this.ds_list_main.getColumn(row, "mobNo")));		//핸드폰   [20171220_01]
         		//this.ds_chg.setColumn(idx, "telNo"   , FN_numberHyphenInReturn(this.ds_list_main.getColumn(row, "telNo")));		//전화번호 [20171220_01]
        	}
        }

        /**
         * 목록 그리드의 Body 영역 셀 더블 클릭 이벤트 처리
         * - 상담 팝업
         */
        this.grd_workList_oncelldblclick = function(obj,e) {
        	if (this.ds_list_main.getRowCount() < 1) {
        		this.alert("상담할 대상계약이 존재하지 않습니다.");
        		return false;
        	}
        	
        	// 팝업화면 연동 파라미터 세팅
        	// - 연락처 추가 [20170612_01]
        	var sStdYm  = this.ds_list_main.getColumn(this.grd_workList.currentrow, "stdYm");
        	var sOrdNo  = this.ds_list_main.getColumn(this.grd_workList.currentrow, "ordNo");
        	var sEquNo  = this.ds_list_main.getColumn(this.grd_workList.currentrow, "equNo");
        	var sJobSeq = this.ds_list_main.getColumn(this.grd_workList.currentrow, "jobSeq");
        	var sSeq    = this.ds_list_main.getColumn(this.grd_workList.currentrow, "seq");
        	var sMobNo  = this.ds_list_main.getColumn(this.grd_workList.currentrow, "mobNo");	// [20170612_01]
        		
        	var arr ={
        		  p_stdYm   : sStdYm
        		, p_ordNo   : sOrdNo
        		, p_equNo   : sEquNo
        		, p_jobSeq  : sJobSeq
        		, p_seq     : sSeq
        		, p_today   : this.toDay
        		, p_userGrp : this.fUserGrp
        		, p_mobNo   : sMobNo
        		, p_userId  : this.fUserId
        	};
        			
        	Ex.core.popup(this, "방문점검 상담관리", "cs::RTCSRegularCheckContactPopUp.xfdl", arr, "modaless=false");
        }

        /**
         * 우편번호 찾기 버튼 클릭 이벤트 처리
         */
        this.btn_postSearch1_onclick = function(obj,e) {
        	var args ={p_arg : "RTSDCustRegister_1"};
        	Ex.core.popup(this,"정기점검 컨택관리","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }
        	
        /**
         * 우편번호 찾기 결과 처리
         */	 
        this.FN_postCd = function(res,division) {
        	if (division == "addr1") {
        		this.posCd.set_value(res[0]);
        		this.addr1.set_value(res[1]);
        		this.addr2.set_value(res[2]);
        		this.ed_bldMngNo.set_value(res[3]);
        		
        		this.fAddr1 = res[1];

        		// 해당 주소 담당 로디안 조회
        		this.getMrByBld(res[3]);
        	}
        }

        /**
         * 건물관리번호별 담당 로디안 조회
         *
         */
        this.getMrByBld = function(bldMngNo) {
        	var sSvcID        	= "getMrByBld";                    
        	var sController   	= "/rtms/cs/selectBldMr.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_mr=ds_mr";
        	var sArgs 			= "bldMngNo=" + nvl(bldMngNo);	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 주소1별 담당 로디안 조회
         */
        this.getMrByAddr1 = function(addr1) {
        	var sSvcID        	= "getMrByAddr1";                    
        	var sController   	= "/rtms/cs/selectAddr1Mr.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_mr=ds_mr";
        	var sArgs 			= "addr1=" + nvl(addr1);	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 로디안 정보 가져오기
         * - 조회기준 변경 [20170622_01]
         */
        this.getRoadianInfo = function() {
        	var sSvcID        	= "carmasterPopUp";                    
        	var sController   	= "/ntrms/cs/carmasterNu.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_mr=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("carmasterNu", this.fUserId);

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 저장 버튼 클릭 이벤트 처리
         */
        this.btn_change_save_onclick = function(obj,e) {
        	if (nvl(this.ed_mrCd.value) == "") {
        		this.alert("담당 로디안을 지정해야 합니다");
        		this.ed_mrCd.setFocus();
        		return false;			
        	}	
        	
        	// 상태변경 후 세부상태 미선택시 에러처리 [20170406_01]
        	if (nvl(this.cmb_obStDtl.text) == "") {
        		this.alert("세부상태를 선택하세요");
        		this.cmb_obStDtl.setFocus();
        		return false;			
        	}
        	
        	if ( confirm( "저장하시겠습니까?") ) {
        		// 핸드폰, 전화번호의 하이픈 제거 [20171220_01]
        		//this.ds_chg.setColumn(0, "mobNo", FN_numberHyphenOut(this.ds_chg.getColumn(0, "mobNo")));
        		//this.ds_chg.setColumn(0, "telNo", FN_numberHyphenOut(this.ds_chg.getColumn(0, "telNo")));
        			
        		var sSvcID        	= "saveContactChange";                    
        		var sController   	= "/rtms/cs/saveContactChange.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		= "ds_chg=ds_chg";
        		sOutDatasets  		= "";
        		
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        /**
         * 상태 콤보 값 변경 이벤트 처리
         */
        this.cmb_provsnSt_onitemchanged = function(obj,e) {
        	this.ds_C028.filter("cd == '' || cd.substr(0,2) == '" + e.postvalue + "'");
        }

        /**
         * 일정 버튼 클릭 이벤트 처리 [20170406_02]
         */
        this.btn_mrSchd_onclick = function(obj,e) {
        	if (nvl(this.ed_mrCd.value) == "") {
        		this.alert("담당 로디안이 지정되지 않았습니다");
        		return false;
        	}
        	
        	if (nvl(this.planDay.value) == "") {
        		this.alert("변경일이 지정되지 않았습니다");
        		return false;
        	}
        	
        	var sPlanYm = this.planDay.value.toString().substr(0,6);
        	var sMrCd   = this.ed_mrCd.value;
        	var sMrNm   = this.ed_mrNm.value;
        	
        	var arr ={
        		  p_planYm  : sPlanYm
        		, p_mrCd    : sMrCd
        		, p_mrNm    : sMrNm
        		, p_today   : this.toDay
        		, p_userGrp : this.fUserGrp
        	};
        			
        	Ex.core.popup(this, "로디안 일정 확인", "cs::RTCSRegularCheckMrSchedulePop.xfdl", arr, "modaless=false");
        }

        /**
         * 핸드폰 키 입력 이벤트 처리 [20171220_01]
         * - 규격에 맞도록 하이픈 처리 및 검증
         */
        this.ed_mobNoChg_onkeyup = function(obj,e) {
        	FN_numberHyphenIn(obj, e);
        }

        /**
         * 전화번호 키 입력 이벤트 처리 [20171220_01]
         * - 규격에 맞도록 하이픈 처리 및 검증
         */
        this.ed_telNoChg_onkeyup = function(obj,e) {
        	FN_numberHyphenIn(obj, e);
        }

        /**
         * 거부철회 버튼 클릭 이벤트 처리 [20170726_01]
         */
        this.btn_deny_onclick = function(obj,e) {
        	var nCurRow = this.grd_workList.currentrow;
        	
        	if (nCurRow < 0) {
        		this.alert("선택된 고객정보가 없습니다");
        		return false;
        	} else {	
        		var arr ={
        			  p_ordNo : this.ds_list_main.getColumn(nCurRow, "ordNo")
        			, p_equNo : this.ds_list_main.getColumn(nCurRow, "equNo")
        			, p_stdYm : this.ds_list_main.getColumn(nCurRow, "stdYm")
        		};
        				
        		Ex.core.popup(this, "정기점검 거부/철회등록", "cs::RTCSRegularCheckDeny_pop.xfdl", arr, "modaless=false");
        	}
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		// 공통코드 조회
        		case "getCommCode":
        			// 조회조건-상태 초기화
        			this.ds_C027_cond.copyData(this.ds_C027);			
        			var insert = this.ds_C027_cond.insertRow(0);
        			this.ds_C027_cond.setColumn(insert,"cd","");
        			this.ds_C027_cond.setColumn(insert,"cdNm","전체");
        			this.div_search.cmb_obSt.set_value("");
        			
        			// 조회조건-(세부)상태 초기화
        			this.ds_C028_cond.copyData(this.ds_C028);			
        			insert = this.ds_C028_cond.insertRow(0);
        			this.ds_C028_cond.setColumn(insert,"cd","");
        			this.ds_C028_cond.setColumn(insert,"cdNm","전체");
        			this.ds_C028_cond.filter("cd == ''");
        			this.div_search.cmb_obStDtl.set_value("");
        		    
        		    // 조회조건-처리상태 초기화 [20170608_01]
        		    this.ds_H008_cond.copyData(this.ds_H008);
        			insert = this.ds_H008_cond.insertRow(0);
        			this.ds_H008_cond.setColumn(insert,"cd","");
        			this.ds_H008_cond.setColumn(insert,"cdNm","전체");			
        			this.div_search.cmb_chkStat.set_value("");
        		    break;
        		    
        		// 목록 조회
        		case "listMain":
        			var rowCt = this.ds_list_main.getRowCount();
        			
        			if( rowCt == 0 ){
        				this.alert("조회된 데이터가 없습니다.");
        				this.grd_workList.set_nodatatext("조회된 데이터가 없습니다.");
        				this.copyDS(-1);
        			} else {
        				this.copyDS(0);
        			}
        			
        			break;
        			
        		// 엑셀
        		case "listExcel":
        			if( this.ds_contactExcel.getRowCount() == 0 ){
        				this.alert("조회된 데이터가 없습니다.");				
        			} else {
        				Ex.core.exportExcel(this, this.grd_exel);
        			}
        			
        			break;
        		
        		// 건물관리번호별 담당 로디안 조회
        		case "getMrByBld":
        			if (this.ds_mr.getRowCount() > 0) {
        				this.ed_mrCd.set_value(this.ds_mr.getColumn(0, "carmasterNu"));
        				this.ed_mrNm.set_value(this.ds_mr.getColumn(0, "carmasterNm"));
        			} else {
        				// 주소1(시군구별) 담당 로디안 재조회
        				this.getMrByAddr1(this.fAddr1);
        			}
        			 	 
        			break;
        			
        		// 주소1(시군구)별 담당 로디안 조회
        		case "getMrByAddr1":
        			if (this.ds_mr.getRowCount() > 0) {
        				this.ed_mrCd.set_value(this.ds_mr.getColumn(0, "carmasterNu"));
        				this.ed_mrNm.set_value(this.ds_mr.getColumn(0, "carmasterNm"));
        			} else {
        				this.ed_mrCd.set_value("");
        				this.ed_mrNm.set_value("");
        				this.alert("담당 로디안이 존재하지 않습니다.");
        			}
        			 	 
        			break;

        		// 서버기준 오늘날자 조회
        		case "getToday":
        			this.div_search.sdYm.set_value(this.toDay);
        			break;
        		
        		// 저장
        		case "saveContactChange":
        			this.alert(strErrorMsg);
        			break;
        		
        		case "carmasterPopUp":
        			var idx = this.ds_mr.rowposition;
        			var carmasterNu 	= this.ds_mr.getColumn(idx, "carmasterNu");
        			var carmasterNm 	= this.ds_mr.getColumn(idx, "carmasterNm");	
        			
        			//로디안인경우
        			if(this.ds_mr.rowcount > 0 && this.fUserGrp == "08") {
        				this.returnCarmaster(carmasterNu, carmasterNm);
        				this.div_search.btn_save01.set_enable(false);
        			}
        			break;
        			
        		default:
        			break;
        	}
        }

        this.ds_list_main_onrowposchanged = function(obj,e)
        {
        	var apprScnt = this.ds_list_main.getColumn(this.ds_list_main.rowposition, "apprScnt");
        	var osDay = this.ds_list_main.getColumn(this.ds_list_main.rowposition, "osDay"); //계약종료일
        	
        	var yyyy = osDay.substring(0, 4);
        	var mm = osDay.substring(4, 6);
        	var dd = osDay.substring(6, 8);
        	
        	trace(yyyy);
        	trace(mm);
        	trace(dd);
        	
        	var _calcDate = new Date(yyyy, mm, dd);
        	_calcDate.setDate(_calcDate.getDate() + 60);
        	
        	var _yyyy = _calcDate.getFullYear();
        	var _mm = _calcDate.getMonth();
        	if(_mm.toString().length == 1){
        		_mm = "0" + _calcDate.getMonth();
        	}
        	
        	var _dd = _calcDate.getDate();
        	if(_dd.toString().length == 1){
        		_dd = "0" + _calcDate.getDate();
        	}
        	
        	trace(_yyyy);
        	trace(_mm);
        	trace(_dd);
        	
        	//연체회차가 2회차 이상부터 서비스 block
        	if(this.fUserGrp != "01"){ //영업관리자는 제외
        		if(apprScnt > 1){
        			this.btn_change_save.set_enable(false);
        			this.btn_mrSchd.set_enable(false);
        			this.btn_deny.set_enable(false);
        		}else{
        			this.btn_change_save.set_enable(true);
        			this.btn_mrSchd.set_enable(true);
        			this.btn_deny.set_enable(true);
        		}	
        	}
        	
        	trace(_yyyy + "" + _mm + "" + _dd);
        	
        	//계약종료이후 60일 초과인경우 변경 금지
        	if(this.fUserGrp != "01" && this.fUserGrp != "02"){ //영업관리자/콜센터는 제외
        		if(this.toDay > _yyyy + "" + _mm + "" + _dd){
        			this.btn_change_save.set_enable(false);
        			this.btn_mrSchd.set_enable(false);
        			this.btn_deny.set_enable(false);
        		}
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_list_main.addEventHandler("onrowposchanged", this.ds_list_main_onrowposchanged, this);
            this.addEventHandler("onload", this.RTCSRegularCheckContact_onload, this);
            this.grd_workList.addEventHandler("oncelldblclick", this.grd_workList_oncelldblclick, this);
            this.grd_workList.addEventHandler("oncellclick", this.grd_workList_oncellclick, this);
            this.div_search.mrCd.addEventHandler("onkeyup", this.div_search_Ed_ctNm_onkeyup, this);
            this.div_search.btn_save01.addEventHandler("onclick", this.div_cust_btn_postSearch1_onclick, this);
            this.div_search.mrNm.addEventHandler("onkeyup", this.div_search_Ed_ctNm_onkeyup, this);
            this.div_search.cmb_obSt.addEventHandler("onitemchanged", this.div_search_cmb_obSt_onitemchanged, this);
            this.div_search.cmb_chkStat.addEventHandler("onitemchanged", this.div_search_cmb_obSt_onitemchanged, this);
            this.btn_postSearch1.addEventHandler("onclick", this.btn_postSearch1_onclick, this);
            this.btn_change_save.addEventHandler("onclick", this.btn_change_save_onclick, this);
            this.cmb_obSt.addEventHandler("onitemchanged", this.cmb_provsnSt_onitemchanged, this);
            this.btn_mrSchd.addEventHandler("onclick", this.btn_mrSchd_onclick, this);
            this.btn_deny.addEventHandler("onclick", this.btn_deny_onclick, this);

        };

        this.loadIncludeScript("RTCSRegularCheckContact.xfdl");

       
    };
}
)();
