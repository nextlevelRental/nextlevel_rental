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
                this.set_name("RTCSInboundAdviceRegister");
                this.set_classname("inboundAdviceRegister");
                this.set_titletext("인바운드상담등록");
                this._setFormPosition(0,0,1147,1040);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_recvTp", this);
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

            obj = new Dataset("ds_region", this);
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

            obj = new Dataset("ds_city", this);
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

            obj = new Dataset("ds_ordList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtcs0102Out", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"jobTp\" type=\"STRING\" size=\"256\"/><Column id=\"jobTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callStatusNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"jobDay\" type=\"STRING\" size=\"256\"/><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtcs0102In", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvTp\" type=\"STRING\" size=\"256\"/><Column id=\"recvTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"recvTm\" type=\"STRING\" size=\"256\"/><Column id=\"resuSt\" type=\"STRING\" size=\"256\"/><Column id=\"resuStNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"smsTx\" type=\"STRING\" size=\"256\"/><Column id=\"regionNo\" type=\"STRING\" size=\"256\"/><Column id=\"cityNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtcs0102", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"recvTm\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"recvTp\" type=\"STRING\" size=\"256\"/><Column id=\"resuSt\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"claimNo\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"endTm\" type=\"STRING\" size=\"256\"/><Column id=\"smsTx\" type=\"STRING\" size=\"256\"/><Column id=\"regionNo\" type=\"STRING\" size=\"256\"/><Column id=\"cityNo\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "8", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_text("상담전화번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "265", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "231", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "624", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "30", null, "12", "0", null, this.div_search);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "369", "10", "118", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_password("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "506", "10", "118", "21", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custNmSearch", "absolute", "485", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "658", "10", "79", "21", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_startDay", "absolute", "726", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("12");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("20150901");
            obj = new Static("Static07", "absolute", "829", "10", "9", "21", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_endDay", "absolute", "841", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("14");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Edit("ed_telNo", "absolute", "111", "10", "121", "21", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_maxlength("15");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_ordList", "absolute", "0", "86", "1122", "200", null, null, this);
            obj.set_taborder("17");
            obj.set_binddataset("ds_ordList");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"95\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"계약상태\"/><Cell col=\"2\" text=\"장착일자(예정)\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"타이어본수\"/><Cell col=\"5\" text=\"계약기간\"/><Cell col=\"6\" text=\"등록비\"/><Cell col=\"7\" text=\"월렌탈료\"/><Cell col=\"8\" text=\"차종\"/><Cell col=\"9\" text=\"차량번호\"/><Cell col=\"10\" text=\"휴대번호\"/><Cell col=\"11\" text=\"전화번호\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:statCdNm\"/><Cell col=\"2\" displaytype=\"date\" text=\"bind:procDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" text=\"bind:matCd\"/><Cell col=\"4\" text=\"bind:cntNm\"/><Cell col=\"5\" text=\"bind:periodNm\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" text=\"bind:regiNm\" mask=\"###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right;\" text=\"bind:monAmt\" mask=\"###,###,##0\"/><Cell col=\"8\" text=\"bind:modelNm\"/><Cell col=\"9\" text=\"bind:carNo\"/><Cell col=\"10\" displaytype=\"normal\" edittype=\"none\" text=\"bind:mobNo\" mask=\"###-####-####\"/><Cell col=\"11\" displaytype=\"normal\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "61", "169", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_text("계약 리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "76", "1147", "10", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "1040", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "302", "169", "20", null, null, this);
            obj.set_taborder("26");
            obj.set_text("아웃바운드 상담리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "317", "1147", "10", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "286", "1147", "20", null, null, this);
            obj.set_taborder("28");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0102Out", "absolute", "0", "327", "800", "200", null, null, this);
            obj.set_taborder("19");
            obj.set_binddataset("ds_rtcs0102Out");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상담유형\"/><Cell col=\"1\" text=\"통화일자\"/><Cell col=\"2\" text=\"통화상태\"/><Cell col=\"3\" text=\"계약번호\"/><Cell col=\"4\" text=\"고객명\"/><Cell col=\"5\" text=\"처리일자\"/><Cell col=\"6\" text=\"상담번호\"/><Cell col=\"7\" text=\"상담사\"/><Cell col=\"8\" text=\"휴대번호\"/><Cell col=\"9\" text=\"전화번호\"/></Band><Band id=\"body\"><Cell text=\"bind:jobTpNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:callDay\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"bind:callStatusNm\"/><Cell col=\"3\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"4\" text=\"bind:custNm\"/><Cell col=\"5\" displaytype=\"date\" text=\"bind:jobDay\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" text=\"bind:callNo\"/><Cell col=\"7\" text=\"bind:userIdNm\"/><Cell col=\"8\" text=\"bind:mobNo\" mask=\"###-####-####\"/><Cell col=\"9\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "527", "1147", "20", null, null, this);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "543", "169", "20", null, null, this);
            obj.set_taborder("30");
            obj.set_text("인바운드 상담리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "558", "1147", "10", null, null, this);
            obj.set_taborder("31");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0102In", "absolute", "0", "568", "800", "200", null, null, this);
            obj.set_taborder("21");
            obj.set_binddataset("ds_rtcs0102In");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상담유형\"/><Cell col=\"1\" text=\"통화일자\"/><Cell col=\"2\" text=\"통화시간\"/><Cell col=\"3\" text=\"처리상태\"/><Cell col=\"4\" text=\"계약번호\"/><Cell col=\"5\" text=\"상담번호\"/><Cell col=\"6\" text=\"상담사\"/><Cell col=\"7\" text=\"상담전화번호\"/></Band><Band id=\"body\"><Cell text=\"bind:recvTpNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:recvDay\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"expr:recvTm == &quot;&quot; ? &quot;&quot;:recvTm.substring(0,2)+&quot;:&quot;+recvTm.substring(2,4)+&quot;:&quot;+recvTm.substring(4)\"/><Cell col=\"3\" text=\"bind:resuStNm\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"none\" text=\"bind:ordNo\"/><Cell col=\"5\" text=\"bind:callNo\"/><Cell col=\"6\" text=\"bind:userIdNm\"/><Cell col=\"7\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "812", "1122", "31", null, null, this);
            obj.set_taborder("32");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "842", "1122", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "0", "920", "1122", "100", null, null, this);
            obj.set_taborder("34");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "0", "812", "80", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("상담일자");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "189", "812", "80", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("상담시간");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "491", "812", "100", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_text("상담전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "825", "817", "112", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_maxlength("10");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "732", "812", "90", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "590", "842", "80", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "675", "847", "141", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "0", "842", "80", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("상담유형");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "189", "842", "80", "31", null, null, this);
            obj.set_taborder("41");
            obj.set_text("지역");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_region", "absolute", "276", "847", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("9");
            obj.set_autoselect("true");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_region");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");

            obj = new Combo("cb_city", "absolute", "402", "847", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("10");
            obj.set_autoselect("true");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_city");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");

            obj = new Combo("cb_recvTp", "absolute", "84", "847", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("8");
            obj.set_autoselect("true");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_recvTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");

            obj = new TextArea("TextArea00", "absolute", "825", "327", "297", "200", null, null, this);
            obj.set_taborder("20");
            obj.set_readonly("true");
            obj.set_linespace("3");
            obj.set_visible("true");
            obj.style.set_linespace("3");
            obj.style.set_background("#ffffffff");
            obj.style.set_color("#9a080aff");
            obj.style.set_shadow("outer 0,0 0 gray");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea01", "absolute", "825", "568", "297", "200", null, null, this);
            obj.set_taborder("22");
            obj.set_readonly("true");
            obj.set_linespace("3");
            obj.set_visible("true");
            obj.style.set_linespace("3");
            obj.style.set_background("#ffffffff");
            obj.style.set_color("#9a080aff");
            obj.style.set_shadow("outer 0,0 0 gray");
            this.addChild(obj.name, obj);

            obj = new TextArea("ed_callDtl", "absolute", "84", "926", "1033", "89", null, null, this);
            obj.set_taborder("14");
            obj.set_readonly("false");
            obj.set_linespace("3");
            obj.set_visible("true");
            obj.style.set_linespace("3");
            obj.style.set_background("#ffffffff");
            obj.style.set_color("#9a080aff");
            obj.style.set_shadow("outer 0,0 0 gray");
            obj.set_maxlength("4000");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "920", "80", "100", null, null, this);
            obj.set_taborder("42");
            obj.set_text("상담내용");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "768", "1147", "20", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "800", "286", "25", "502", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "0", "1020", "1147", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_recvDay", "absolute", "85", "818", "100", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");

            obj = new Static("Static25", "absolute", "326", "817", "15", "21", null, null, this);
            obj.set_taborder("46");
            obj.set_text("시");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "404", "817", "15", "21", null, null, this);
            obj.set_taborder("47");
            obj.set_text("분");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "474", "817", "15", "21", null, null, this);
            obj.set_taborder("48");
            obj.set_text("초");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "0", "872", "1122", "50", null, null, this);
            obj.set_taborder("49");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "0", "872", "80", "50", null, null, this);
            obj.set_taborder("50");
            obj.set_text("SMS내용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new TextArea("ed_smsTx", "absolute", "84", "877", "1033", "40", null, null, this);
            obj.set_taborder("13");
            obj.set_linespace("3");
            obj.style.set_linespace("3");
            obj.style.set_background("#ffffffff");
            obj.style.set_color("#9a080aff");
            obj.style.set_shadow("outer 0,0 0 gray");
            obj.set_maxlength("300");
            this.addChild(obj.name, obj);

            obj = new Button("btn_new", "absolute", "957", "788", "80", "21", null, null, this);
            obj.set_taborder("23");
            obj.set_text("신규");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", "1042", "788", "80", "21", null, null, this);
            obj.set_taborder("24");
            obj.set_text("저장");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_hh", "absolute", "275", "818", "45", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_inputtype("number");
            obj.set_maxlength("2");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mi", "absolute", "351", "818", "45", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_inputtype("number");
            obj.set_maxlength("2");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ss", "absolute", "425", "818", "45", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_inputtype("number");
            obj.set_maxlength("2");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "941", "812", "70", "31", null, null, this);
            obj.set_taborder("51");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "1015", "817", "100", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_maxlength("50");
            obj.set_lengthunit("ascii");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "821", "842", "90", "31", null, null, this);
            obj.set_taborder("52");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "915", "847", "201", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_telNo", "absolute", "595", "817", "133", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_maxlength("15");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "1077", "59", "45", "22", null, null, this);
            obj.set_taborder("53");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "1077", "300", "45", "22", null, null, this);
            obj.set_taborder("54");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "1077", "541", "45", "22", null, null, this);
            obj.set_taborder("55");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
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
            obj = new Layout("default", "", 1147, 1040, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("inboundAdviceRegister");
            		p.set_titletext("인바운드상담등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","cal_recvDay","value","ds_rtcs0102","recvDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_telNo","value","ds_rtcs0102","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cb_recvTp","value","ds_rtcs0102","recvTp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_custNo","value","ds_rtcs0102","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_carNo","value","ds_rtcs0102","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_smsTx","value","ds_rtcs0102","smsTx");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_callDtl","value","ds_rtcs0102","callDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","cb_region","value","ds_rtcs0102","regionNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","cb_city","value","ds_rtcs0102","cityNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_custNm","value","ds_rtcs0102","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_ordNo","value","ds_rtcs0102","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","TextArea00","value","ds_rtcs0102Out","callDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","TextArea01","value","ds_rtcs0102In","callDtl");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSInboundAdviceRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSInboundAdviceRegister.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSInboundAdviceRegister.xfdl
         * 설    명 : 인바운드 상담등록
         * 작 성 자 : 
         * 변경이력 
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2018-02-06	wjim		[20180206_01] EAI를 통한 QMS 연동을 고려하여 인바운드 상담등록 저장 트랜젝션 시간 연장
         * 2018-08-08	wjim		[20180808_01] AS접수 시 QMS 연동을 고려하여 고객명 최대 입력 크기 제한 (20byte)
         ***************************************************************************************************/
         
        //include "lib::comLib.xjs"; 
        this.p_arg = "RTCSInboundAdviceRegister";
        this.selectSysdate = "0";

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	
        	if( strSvcId == "initRTCSInboundAdviceRegister" ){
        		var recvTpCnt = this.ds_recvTp.getRowCount();
        		if( recvTpCnt == 0 ){
        			alert("상담유형 값이 없으므로 신규 저장 하실 수 없습니다.");
        			this.btn_new.set_enable(false);
        			this.btn_save.set_enable(false);
        		}else{
        			this.btn_new.set_enable(true);
        			this.btn_save.set_enable(true);
        		}
        	}
        	
        	if( strSvcId == "selectRTCSInboundAdviceRegister" ){
        	
        		var ordListCt = this.ds_ordList.getRowCount();
        		if( ordListCt == 0 ){
        			this.grid_ordList.set_nodatatext("조회된 데이터가 없습니다.");
        		}

        		var rtcs0102OutListCt = this.ds_rtcs0102Out.getRowCount();
        		if( rtcs0102OutListCt == 0 ){
        			this.grid_rtcs0102Out.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        		
        		var rtcs0102InListCt = this.ds_rtcs0102In.getRowCount();
        		if( rtcs0102InListCt == 0 ){
        			this.grid_rtcs0102In.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        		
         		if( ordListCt == 0 ){
         			alert("조회된 데이터가 없습니다.");
         		}
        	}
        	
        	if( strSvcId == "selectRTCSInboundAdviceDetail" ){

        
         		var rtcs0102OutListCt = this.ds_rtcs0102Out.getRowCount();
         		if( rtcs0102OutListCt == 0 ){
         			this.grid_rtcs0102Out.set_nodatatext("조회된 데이터가 없습니다.");
         		}
         		
         		var rtcs0102InListCt = this.ds_rtcs0102In.getRowCount();
         		if( rtcs0102InListCt == 0 ){
         			this.grid_rtcs0102In.set_nodatatext("조회된 데이터가 없습니다.");
         		}
         		
         		if( rtcs0102OutListCt == 0 && rtcs0102InListCt == 0){
         			alert("조회된 데이터가 없습니다.");
         		}
        	}
        	
        	if( strSvcId == "saveRTCSInboundAdviceRegister" ){
        		if( nErrorCode == "0" ){
        			alert(strErrorMsg);
        			this.reload();
        		}else{
        			alert(strErrorMsg);
        		}
        	}
        	
        	if( strSvcId == "selectSysdate" ){
        		if( this.selectSysdate != "0" ){
        			this.cal_recvDay.set_value( this.selectSysdate.substring(0,9) );
        			this.ed_hh.set_value( this.selectSysdate.substring(8,10) );
        			this.ed_mi.set_value( this.selectSysdate.substring(10,12) );
        		}
        	}
        }

        

        this.RTCSInboundAdviceRegister_onload = function(obj,e)
        {
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("S", this);
        	
        	var auth = Ex.core.o_auth;
        	if( auth.exptAuthYn == "N" ){
        		this.Button00.set_enable(false);
        		this.Button01.set_enable(false);
        		this.Button02.set_enable(false);
        	}
        }

        

        this.fn_init = function(){
        	//this.div_search.cal_startDay.set_value(FN_firstDay());
        	this.div_search.cal_endDay.set_value(FN_today());
        	
        	var sSvcID      	= "initRTCSInboundAdviceRegister";  
        	var sController   	= "rtms/cs/initRTCSInboundAdviceRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		 
        	sOutDatasets += " ds_recvTp=mapDsRecvTp ";
        	sOutDatasets += " ds_region=sRtcs0103RegionMap ";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        

        this.div_search_ed_telNo_onkeyup = function(obj,e)
        {
        	FN_numberHyphenIn(obj, e);
        }

        

        this.fn_search = function(){
        	
        	var telNo  = FN_numberHyphenOut(nvl(this.div_search.ed_telNo.value));
        	var custNm = nvl(this.div_search.ed_custNm.value);
        	var custNo = nvl(this.div_search.ed_custNo.value);
        	
        	var startDay	= nvl(this.div_search.cal_startDay.text);
        	var endDay  	= nvl(this.div_search.cal_endDay.text);
        	
        	var newDate_start = new Date(startDay);
        	var yy_start = newDate_start.getYear();
        	var newDate_end = new Date(endDay);
        	var yy_end = newDate_end.getYear();
        	
        	var today = new Date();
            var diff_date = (new Date(endDay) - new Date(startDay)) / 1000 / 60 / 60 / 24;
            
        	if(nvl(yy_start).length < 4 || nvl(yy_end).length < 4){
        		this.alert("조회일자를 잘못입력하셨습니다.");
        		return;
        	}	
        	
        	if(new Date(startDay) < new Date("2015-09-01")){
        		this.alert("조회일자를 잘못입력하셨습니다.");
        		return;
        	}
        	
        // 	if(diff_date > 180){
        // 		this.alert("조회기간은 180일 이내로 제한됩니다.");
        // 		return;
        // 	}
        	
        	if( nvl(telNo) == "" && nvl(custNm) == "" && nvl(custNo) == "" && nvl(startDay) == "" && nvl(endDay) == ""){
        		alert("조회조건 값이 없습니다.");
        		return;
        	}
        	
        	if((nvl(startDay) == "" && nvl(endDay) != "") || (nvl(startDay) != "" && nvl(endDay) == "")){
        		alert("조회일자는 from-to를 모두 입력해주십시오.");
        		return;
        	}

        	if( nvl(telNo) == "" && nvl(custNm) == "" && nvl(custNo) == ""){
        		alert("조회일자와 조회조건 값 1개는 필수입니다.");
        		return;
        	}
        	
        	if( nvl(startDay) == "" && nvl(endDay) == ""){
        		alert("조회일자와 조회조건 값 1개는 필수입니다.");
        		return;
        	}
        	
        	
        //	if( telNo != "" || custNm != "" || custNo != ""){

        		var sSvcID        	= "selectRTCSInboundAdviceRegister";                    
        		var sController   	= "rtms/cs/selectRTCSInboundAdviceRegister.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sOutDatasets += " ds_ordList=sRtcs0102CtfMap ";
         		sOutDatasets += " ds_rtcs0102Out=sRtcs0102ObfMap ";
         		sOutDatasets += " ds_rtcs0102In=sRtcs0102IbfMap ";
        		
        		sArgs += Ex.util.setParam("telNo",  	telNo);
        		sArgs += Ex.util.setParam("custNm",  	custNm);
        		sArgs += Ex.util.setParam("custNo",  	custNo);
        		sArgs += Ex.util.setParam("startDay",	startDay.replace(/-/g, ""));
        		sArgs += Ex.util.setParam("endDay",  	endDay.replace(/-/g, ""));
        		
        		this.ds_ordList.clearData();
        		this.ds_rtcs0102Out.clearData();
        		this.ds_rtcs0102In.clearData();
        		this.ds_rtcs0102.clearData();
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        //  	}else{
        //  		alert("조회조건 값이 없습니다.");
        //  	}
        }

        

        this.div_search_btn_custNmSearch_onclick = function(obj,e)
        {
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.FN_custNo = function(res){
        	this.div_search.ed_telNo.set_value(FN_numberHyphenInReturn(res[0]));
        	this.div_search.ed_custNm.set_value(res[1]);
        	this.div_search.ed_custNo.set_value(res[2]);
        	
        	this.ds_ordList.clearData();
        	this.ds_rtcs0102Out.clearData();
        	this.ds_rtcs0102In.clearData();
        	this.ds_rtcs0102.clearData();
        }

        this.FN_register = function(){

        	if( confirm( "인바운드 상담 등록하시겠습니까?")){
        		this.FN_new();
        		var rowPo1 = this.ds_ordList.rowposition;
        		var rowPo2 = this.ds_rtcs0102.rowposition;
        		
        		this.ds_rtcs0102.setColumn(rowPo2, "telNo", 	FN_numberHyphenInReturn(nvl(this.ds_ordList.getColumn(rowPo1, "mobNo"))) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "carNo", 	nvl(this.ds_ordList.getColumn(rowPo1, "carNo")) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "custNm", 	nvl(this.ds_ordList.getColumn(rowPo1, "custNm")) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "custNo", 	nvl(this.ds_ordList.getColumn(rowPo1, "custNo")) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "ordNo", 	nvl(this.ds_ordList.getColumn(rowPo1, "ordNo")) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "chanCd", 	nvl(this.ds_ordList.getColumn(rowPo1, "chanCd")) 	);
        		
        		this.ed_custNo.set_enable(false);
        		this.ed_ordNo.set_enable(false);
        	}
        }

        this.grid_ordList_oncelldblclick = function(obj,e)
        {
        	if( confirm( "인바운드 상담 등록하시겠습니까?")){
        		this.FN_new();
        		var rowPo1 = this.ds_ordList.rowposition;
        		var rowPo2 = this.ds_rtcs0102.rowposition;
        		
        		this.ds_rtcs0102.setColumn(rowPo2, "telNo", 	FN_numberHyphenInReturn(nvl(this.ds_ordList.getColumn(rowPo1, "mobNo"))) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "carNo", 	nvl(this.ds_ordList.getColumn(rowPo1, "carNo")) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "custNm", 	nvl(this.ds_ordList.getColumn(rowPo1, "custNm")) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "custNo", 	nvl(this.ds_ordList.getColumn(rowPo1, "custNo")) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "ordNo", 	nvl(this.ds_ordList.getColumn(rowPo1, "ordNo")) 	);
        		this.ds_rtcs0102.setColumn(rowPo2, "chanCd", 	nvl(this.ds_ordList.getColumn(rowPo1, "chanCd")) 	);
        		
        		this.ed_custNo.set_enable(false);
        		this.ed_ordNo.set_enable(false);
        	}
        }

        

        this.div_search_ed_custNm_onkeyup = function(obj,e)
        {
        	this.div_search.ed_custNo.set_value("");
        }
         

        
        this.ed_custNo_onchanged = function(obj,e)
        {
        	if( obj.value.length != 10 ){
        		alert("고객번호를 다시 확인하세요.");
        		//obj.set_value("");
        		var rowPo 	= this.ds_rtcs0102.rowposition;
        		this.ds_rtcs0102.setColumn(rowPo, "custNo", "");
        		obj.setFocus();
        	}
        }

        

        this.ed_ordNo_onchanged = function(obj,e)
        {
        	if( obj.value.length != 12 ){
        		alert("주문번호를 다시 확인하세요.");
        		//obj.set_value("");
        		var rowPo 	= this.ds_rtcs0102.rowposition;
        		this.ds_rtcs0102.setColumn(rowPo, "ordNo", "");
        		obj.setFocus();
        	}
        }

        

        this.ed_carNo_onchanged = function(obj,e)
        {
        	//var pattern1      = /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 					 			// 12저3456
        	//var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{1}|d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 	// 서울12치1234
        	var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 				// 12저3456
        	var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234
        	var carNoVal 		= nvl(this.ed_carNo.value);
        	var carNoValLen 	= carNoVal.length;
        	
        	if( carNoValLen == 7 ){
        		if( !pattern1.test(carNoVal) ){
        			alert( "차량번호를 확인하세요." );
        			this.ed_carNo.setFocus(true);
        			this.ed_carNo.set_value("");
        			return false;
        		}
        	}else if( carNoValLen == 8 || carNoValLen == 9){
        		if( !pattern2.test(carNoVal) ){
        			alert( "차량번호를 확인하세요." );
        			this.ed_carNo.setFocus(true);
        			this.ed_carNo.setSelect();
        			return false;
        		}
        	}else{
        		alert( "차량번호를 확인하세요." );
        		this.ed_carNo.setFocus(true);
        		this.ed_carNo.set_value("");
        		return false;
        	}
        }

        

        this.ed_hh_onchanged = function(obj,e)
        {
        	if( obj.value != "" ){
        		var hh = nvl(parseInt(obj.value));
        		if( 0 > hh || hh > 25 ){
        			alert("상담시간 시는 0 ~ 24 시까지 입력하셔야 합니다.");
        			this.ed_hh.set_value(0);
        			this.ed_hh.setFocus();
        		}
        	}
        }

        

        this.ed_mi_onchanged = function(obj,e)
        {
        	if( obj.value != "" ){
        		var mi = nvl(parseInt(obj.value));
        		if( 0 > mi || mi > 59 ){
        			alert("상담시간 분은 0 ~ 59 분까지 입력하셔야 합니다.");
        			this.ed_mi.set_value(0);
        			this.ed_mi.setFocus();
        		}
        	}
        }

        

        this.ed_ss_onchanged = function(obj,e)
        {
        	if( obj.value != "" ){
        		var ss = nvl(parseInt(obj.value));
        		if( 0 > ss || ss > 59 ){
        			alert("상담시간 분은 0 ~ 59 분까지 입력하셔야 합니다.");
        			this.ed_ss.set_value(0);
        			this.ed_ss.setFocus();
        		}
        	}
        }

        

        this.cb_city_onitemchanged = function(obj,e)
        {
        	var regionNo = nvl(this.cb_region.value);
        	
        	if( regionNo != ""){
        		var sSvcID        	= "sRtcs0103City";                    
        		var sController   	= "rtms/cs/sRtcs0103City.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sOutDatasets += " ds_city=sRtcs0103CityMap ";
        		
        		sArgs += Ex.util.setParam("regionNo",  regionNo);
        		
        		this.ds_city.clearData();
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        

        this.btn_new_onclick = function(obj,e)
        {
        	this.FN_new();
        	this.ed_custNo.set_enable(false);
        	this.ed_ordNo.set_enable(false);
        }

        

        this.FN_new = function(){
        	this.ds_rtcs0102.clearData();
        	this.ds_rtcs0102.addRow();
        	//this.ed_hh.set_value("");
        	//this.ed_mi.set_value("");
        	this.ed_ss.set_value("00");
        	//this.ed_hh.set_enable(true);
        	//this.ed_mi.set_enable(true);
        	//this.ed_ss.set_enable(true);
        	this.FN_setEnableTrue();
        	this.FN_selectSysdate();
        	this.ed_telNo.setFocus(true);
        }

        

        this.FN_stringByteLength = function(p_val){
        	var objString = new String(p_val);
        	var stringByteLength = 0;
        	for(var i=0; i<objString.length; i++)
        	{
        		if( escape(objString.charAt(i)).length >= 4)  stringByteLength += 3;
        		else if(escape(objString.charAt(i)) == "%A7") stringByteLength += 3;
        		else if(escape(objString.charAt(i)) != "%0D") stringByteLength++;
        	}
        	return stringByteLength;
        }

        
        this.ed_telNo_onkeyup = function(obj,e)
        {
        	FN_numberHyphenIn(obj, e);
        }

        this.FN_selectSysdate = function(){
        	var sSvcID      	= "selectSysdate";  
        	var sController   	= "rtms/cs/selectSysdate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /**
         * 저장 버튼 클릭 이벤트 처리
         * - 인바운드 상담내역 저장
         */ 
        this.btn_save_onclick = function(obj,e)
        {
        	
        	var rowCt 	= this.ds_rtcs0102.getRowCount();
        	var rowPo 	= this.ds_rtcs0102.rowposition;
        	var msg 	= " 값이 없습니다.";

        	if( rowCt == 1 ){
        		var hh = nvl(this.ed_hh.value);
        		var mi = nvl(this.ed_mi.value);
        		var ss = nvl(this.ed_ss.value);
        		var recvTmCreate = "";
        		
        		if( hh == "" ){
        			alert("상담시간 값이 없습니다.");
        			this.ed_hh.setFocus(true);
        			return false;
        		}
        		if( mi == "" ){
        			alert("상담시간 값이 없습니다.");
        			this.ed_mi.setFocus(true);
        			return false;
        		}
        		if( ss == "" ){
        			alert("상담시간 값이 없습니다.");
        			this.ed_ss.setFocus(true);
        			return false;
        		}
        		
        		if( hh.length == 1){
        			recvTmCreate += 0+hh;
        		}else{
        			recvTmCreate += hh;
        		}
        		
        		if( mi.length == 1){
        			recvTmCreate += 0+mi;
        		}else{
        			recvTmCreate += mi;
        		}
        		
        		if( ss.length == 1){
        			recvTmCreate += 0+ss;
        		}else{
        			recvTmCreate += ss;
        		}
        		
        		if( recvTmCreate.length != 6){
        			alert("상담시간을 다시 확인해주세요.");
        		}else{
        			this.ds_rtcs0102.setColumn(rowPo, "recvTm", recvTmCreate);
        		}
        		
        		this.ds_rtcs0102.setColumn(rowPo, "resuSt", "E");
        		
        		var recvDay 	= nvl(this.ds_rtcs0102.getColumn(rowPo, "recvDay"));
        		var recvTm 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "recvTm"));
        		var recvTp 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "recvTp"));
        		var ordNo 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "ordNo"));
        		var custNo 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "custNo"));
        		var custNm 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "custNm"));
        		var telNo 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "telNo"));
        		var callDtl 	= nvl(this.ds_rtcs0102.getColumn(rowPo, "callDtl"));
        		var smsTx 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "smsTx"));
        		var regionNo 	= nvl(this.ds_rtcs0102.getColumn(rowPo, "regionNo"));
        		var cityNo 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "cityNo"));
        		var carNo 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "carNo"));
        		var chanCd 		= nvl(this.ds_rtcs0102.getColumn(rowPo, "chanCd"));
        		
        		if( this.FN_stringByteLength(smsTx) > 100 ){
        			alert("SMS내용 크기가 100byte를 초과했습니다.\n한글일경우 33자, 영문일경우 100자\n입니다. ");
        			return false;
        		}
        		
        		if( this.FN_stringByteLength(callDtl) > 4000 ){
        			alert("SMS내용 크기가 4000byte를 초과했습니다.\n한글일경우 1333자, 영문일경우 4000자\n입니다. ");
        			return false;
        		}
        		
        		if( recvTp == "" ){
        			alert("상담유형" + msg);
        			this.cb_recvTp.setFocus(true);
        			return false;
        		}else if( recvDay == "" ){
        			alert("상담일자" + msg);
        			return false;
        		}else if( recvTm == "" ){
        			alert("상담시간" + msg);
        			this.ed_hh.setFocus(true);
        			return false;
        		}else if( telNo == "" ){
        			alert("상담전화번호" + msg);
        			this.ed_telNo.setFocus(true);
        			return false;
        		}else if( custNm == "" ){
        			alert("고객명" + msg);
        			this.ed_custNm.setFocus(true);
        			return false;
        		}else if( callDtl == "" ){
        			alert("상담내용" + msg);
        			this.ed_callDtl.setFocus(true);
        			return false;
        		}else{
        			if( recvTp == "I1" ){//AS접수일 경우 체크
        			
        				if( custNo == "" ){
        					alert("고객번호" + msg);
        					return false;
        				}else if( ordNo == "" ){
        					alert("계약번호" + msg);
        					return false;
        				}else if( regionNo == "" ){
        					alert("지역" + msg);
        					this.cb_region.setFocus(true);
        					return false;
        				}else if( cityNo == "" ){
        					alert("지역" + msg);
        					this.cb_city.setFocus(true);
        					return false;
        				}else if( smsTx == "" ){
        					alert("SMS내용" + msg);
        					this.ed_smsTx.setFocus(true);
        					return false;
        				}else if( !FN_mobNoCheck(telNo) ){
        					alert("상담유형이 AS접수일 경우 휴대폰번호만 등록가능합니다.");
        					this.ed_telNo.setFocus(true);
        					return false;
        				}else if ( chanCd ==""){
        					alert("채널구분" + msg);
        					return false;
        				// [20180808_01] 고객명 입력 크기 제한
        				// - QMS 해당 컬럼 사이즈가 20byte 임
        				// - QMS 연동 시 UTF-8 로 인코딩 됨 (한글:3byte)
        				}else if ( Eco.string.getLength(custNm, "utf8") > 20 ){
        					var msg2 = "고객명 크기가 20 byte를 초과(" + Eco.string.getLength(custNm, "utf8") + ")했습니다.";
        					msg2 += "\n한글일 경우 6자, 영문일 경우 20자 입니다.";
        					
        					alert(msg2);
        					this.ed_custNm.setFocus(true);
        					return false;
        				}else{
        					this.FN_goSave();
        				}
        			}else{
        				this.FN_goSave();
        			}				
        		}
        	}
        }

        this.FN_goSave = function(){
        	
        	if( confirm( "저장하시겠습니까?")){
        	
        		this.ds_rtcs0102.setColumn(0, "telNo", FN_numberHyphenOut(nvl(this.ds_rtcs0102.getColumn(0, "telNo"))));
        	
        		var sSvcID        	= "saveRTCSInboundAdviceRegister";                    
        		var sController   	= "rtms/cs/saveRTCSInboundAdviceRegister.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets			+= " input=ds_rtcs0102:U ";
        		var fn_callBack		= "fn_callBack";
        		
        		// [20180206_01] EAI I/F 시 time-out 시간을 고려하여 transaction 시간 연장
        		// - 이 부분이 없으면 time-out 에러메시지가 출력이 안됨
        		application.set_httptimeout(300);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        this.grid_rtcs0102In_onselectchanged = function(obj,e)
        {
        	this.ds_rtcs0102.deleteAll();
        	var nRow = this.ds_rtcs0102In.rowposition;
        	var addRow = this.ds_rtcs0102.addRow();
        	
        	this.ds_rtcs0102.setColumn(addRow, "callNo", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "callNo")) );
        	this.ds_rtcs0102.setColumn(addRow, "recvDay", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "recvDay")) );	
        	this.ds_rtcs0102.setColumn(addRow, "recvTm", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "recvTm")) );
        	this.ds_rtcs0102.setColumn(addRow, "userId", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "userId")) );
        	this.ds_rtcs0102.setColumn(addRow, "recvTp", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "recvTp")) );
        	this.ds_rtcs0102.setColumn(addRow, "resuSt", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "resuSt")) );
        	this.ds_rtcs0102.setColumn(addRow, "ordNo", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "ordNo")) );
        	this.ds_rtcs0102.setColumn(addRow, "custNo", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "custNo")) );
        	this.ds_rtcs0102.setColumn(addRow, "custNm", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "custNm")) );
        	this.ds_rtcs0102.setColumn(addRow, "telNo", 	FN_numberHyphenInReturn(nvl(this.ds_rtcs0102In.getColumn(nRow, "telNo"))) );
        	this.ds_rtcs0102.setColumn(addRow, "callDtl", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "callDtl")) );
        	this.ds_rtcs0102.setColumn(addRow, "claimNo", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "claimNo")) );
        	this.ds_rtcs0102.setColumn(addRow, "endDay", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "endDay")) );
        	this.ds_rtcs0102.setColumn(addRow, "endTm", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "endTm")) );
        	this.ds_rtcs0102.setColumn(addRow, "smsTx", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "smsTx")) );
        	this.ds_rtcs0102.setColumn(addRow, "regionNo", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "regionNo")) );
        	this.cb_city_onitemchanged();
        	this.ds_rtcs0102.setColumn(addRow, "cityNo", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "cityNo")) );
        	this.ds_rtcs0102.setColumn(addRow, "carNo", 	nvl(this.ds_rtcs0102In.getColumn(nRow, "carNo")) );
        	
        	var recvTm = nvl(this.ds_rtcs0102In.getColumn(nRow, "recvTm"));
        	if( recvTm.length == 6 ){
        		this.ed_hh.set_value( recvTm.substring(0,2) );
        		this.ed_mi.set_value( recvTm.substring(2,4) );
        		this.ed_ss.set_value( recvTm.substring(4) 	);
        	}
        	this.ds_rtcs0102.set_updatecontrol(false);
        	this.ds_rtcs0102.setRowType(addRow, 4);
        	this.ds_rtcs0102.set_updatecontrol(true);
        	
        	this.FN_setEnableFalse();		
        }

        this.FN_setEnableFalse = function(){
        	var recvTp = nvl(this.ds_rtcs0102.getColumn(this.ds_rtcs0102.rowposition, "recvTp"));
        	this.cal_recvDay.set_enable(false);
        	this.ed_hh.set_enable(false);
        	this.ed_mi.set_enable(false);
        	this.ed_ss.set_enable(false);
        	this.ed_telNo.set_enable(false);
        	this.ed_carNo.set_enable(false);
        	this.ed_custNm.set_enable(false);
        	this.cb_recvTp.set_enable(false);
        	this.cb_region.set_enable(false);
        	this.cb_city.set_enable(false);
        	this.ed_custNo.set_enable(false);
        	if( recvTp == "I1" ){//AS접수일 경우 체크
        		this.btn_save.set_enable(false);
        	}else{
        		this.btn_save.set_enable(true);
        	}
        }

        this.FN_setEnableTrue = function(){
        	this.cal_recvDay.set_enable(false);
        	this.ed_hh.set_enable(true);
        	this.ed_mi.set_enable(true);
        	this.ed_ss.set_enable(true);
        	this.ed_telNo.set_enable(true);
        	this.ed_carNo.set_enable(true);
        	this.ed_custNm.set_enable(true);
        	this.cb_recvTp.set_enable(true);
        	this.cb_region.set_enable(true);
        	this.cb_city.set_enable(true);
        	this.ed_custNo.set_enable(true);
        	this.btn_save.set_enable(true);
        }

        this.Button00_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.grid_ordList);
        }

        this.Button01_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.grid_rtcs0102Out);
        }

        this.Button02_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.grid_rtcs0102In);
        }

        this.grid_ordList_oncellclick = function(obj,e)
        {
        // 	if(e.cell == 0){
        // 		this.FN_register();
        // 	}else{
        // 	
        // 		var custNo = nvl(this.ds_ordList.getColumn(this.ds_ordList.rowposition, "custNo"));
        // 		
        // 		var sSvcID        	= "selectRTCSInboundAdviceDetail";                    
        // 		var sController   	= "rtms/cs/selectRTCSInboundAdviceDetail.do";
        // 		var sInDatasets   	= "";
        // 		var sOutDatasets  	= "";
        // 		var sArgs 			= "";	
        // 		var fn_callBack		= "fn_callBack";
        // 		
        // 		sOutDatasets  = " ds_rtcs0102Out=sRtcs0102ObfMap ";
        // 		sOutDatasets += " ds_rtcs0102In=sRtcs0102IbfMap ";
        // 		
        // 		
        // 		sArgs += Ex.util.setParam("custNo",  	custNo);
        // 		
        // 		this.ds_rtcs0102Out.clearData();
        // 		this.ds_rtcs0102In.clearData();
        // 		
        // 		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        // 	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSInboundAdviceRegister_onload, this);
            this.div_search.ed_custNm.addEventHandler("onkeyup", this.div_search_ed_custNm_onkeyup, this);
            this.div_search.btn_custNmSearch.addEventHandler("onclick", this.div_search_btn_custNmSearch_onclick, this);
            this.div_search.ed_telNo.addEventHandler("onkeyup", this.div_search_ed_telNo_onkeyup, this);
            this.grid_ordList.addEventHandler("oncelldblclick", this.grid_ordList_oncelldblclick, this);
            this.grid_ordList.addEventHandler("oncellclick", this.grid_ordList_oncellclick, this);
            this.grid_rtcs0102Out.addEventHandler("onselectchanged", this.grid_carMasterSelect_onselectchanged, this);
            this.grid_rtcs0102In.addEventHandler("onselectchanged", this.grid_rtcs0102In_onselectchanged, this);
            this.ed_carNo.addEventHandler("onchanged", this.ed_carNo_onchanged, this);
            this.ed_custNo.addEventHandler("onchanged", this.ed_custNo_onchanged, this);
            this.cb_region.addEventHandler("onitemchanged", this.cb_city_onitemchanged, this);
            this.cb_recvTp.addEventHandler("onitemchanged", this.div_search_cb_makerSearch_onitemchanged, this);
            this.btn_new.addEventHandler("onclick", this.btn_new_onclick, this);
            this.btn_save.addEventHandler("onclick", this.btn_save_onclick, this);
            this.ed_hh.addEventHandler("onchanged", this.ed_hh_onchanged, this);
            this.ed_mi.addEventHandler("onchanged", this.ed_mi_onchanged, this);
            this.ed_ss.addEventHandler("onchanged", this.ed_ss_onchanged, this);
            this.ed_ordNo.addEventHandler("onchanged", this.ed_ordNo_onchanged, this);
            this.ed_telNo.addEventHandler("onkeyup", this.ed_telNo_onkeyup, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);

        };

        this.loadIncludeScript("RTCSInboundAdviceRegister.xfdl");

       
    };
}
)();
