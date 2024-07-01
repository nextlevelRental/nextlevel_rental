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
                this.set_name("RTCSRegularCheck");
                this.set_classname("contractStatus");
                this.set_titletext("점검 작업목록조회");
                this._setFormPosition(0,0,1147,544);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsWorkList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"mobNo\" type=\"string\" size=\"32\"/><Column id=\"cMileage\" type=\"bigdecimal\" size=\"16\"/><Column id=\"custNo\" type=\"string\" size=\"32\"/><Column id=\"ordNo\" type=\"string\" size=\"32\"/><Column id=\"matCd\" type=\"string\" size=\"32\"/><Column id=\"poscd\" type=\"string\" size=\"32\"/><Column id=\"equNo\" type=\"string\" size=\"32\"/><Column id=\"aMzileage\" type=\"string\" size=\"32\"/><Column id=\"chkStatNm\" type=\"string\" size=\"32\"/><Column id=\"cntNm\" type=\"string\" size=\"32\"/><Column id=\"carNo\" type=\"string\" size=\"32\"/><Column id=\"planDay\" type=\"string\" size=\"32\"/><Column id=\"matNm\" type=\"string\" size=\"32\"/><Column id=\"addr1\" type=\"string\" size=\"32\"/><Column id=\"planTm\" type=\"string\" size=\"32\"/><Column id=\"chkStat\" type=\"string\" size=\"32\"/><Column id=\"procTm\" type=\"string\" size=\"32\"/><Column id=\"addr1Old\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"string\" size=\"32\"/><Column id=\"cntCd\" type=\"string\" size=\"32\"/><Column id=\"seq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"jobSeq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"custName\" type=\"string\" size=\"32\"/><Column id=\"telNo\" type=\"string\" size=\"32\"/><Column id=\"stdYm\" type=\"string\" size=\"32\"/><Column id=\"procDay\" type=\"string\" size=\"32\"/><Column id=\"delyYn\" type=\"STRING\" size=\"256\"/><Column id=\"mrNm\" type=\"STRING\" size=\"256\"/><Column id=\"rMrnm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsChg", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"mobNo\" type=\"string\" size=\"32\"/><Column id=\"ordNo\" type=\"string\" size=\"32\"/><Column id=\"posY\" type=\"string\" size=\"32\"/><Column id=\"posX\" type=\"string\" size=\"32\"/><Column id=\"mrCd\" type=\"string\" size=\"32\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"poscd\" type=\"string\" size=\"32\"/><Column id=\"equNo\" type=\"string\" size=\"32\"/><Column id=\"planDaya\" type=\"string\" size=\"32\"/><Column id=\"bldMngNo\" type=\"string\" size=\"32\"/><Column id=\"planDay\" type=\"string\" size=\"32\"/><Column id=\"chkStat\" type=\"string\" size=\"32\"/><Column id=\"planTm\" type=\"string\" size=\"32\"/><Column id=\"addr1\" type=\"string\" size=\"32\"/><Column id=\"addr2\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"string\" size=\"32\"/><Column id=\"seq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"jobSeq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"reqDesc\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"string\" size=\"32\"/><Column id=\"planTma\" type=\"string\" size=\"32\"/><Column id=\"telNo\" type=\"string\" size=\"32\"/><Column id=\"regId\" type=\"string\" size=\"32\"/><Column id=\"stdYm\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsResult", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"npDesc\" type=\"string\" size=\"32\"/><Column id=\"ordNo\" type=\"string\" size=\"32\"/><Column id=\"procTm\" type=\"string\" size=\"32\"/><Column id=\"chkStat\" type=\"string\" size=\"32\"/><Column id=\"jobSeq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"aMileage\" type=\"string\" size=\"32\"/><Column id=\"equNo\" type=\"string\" size=\"32\"/><Column id=\"stdYm\" type=\"string\" size=\"32\"/><Column id=\"procDay\" type=\"string\" size=\"32\"/><Column id=\"chkStatNm\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_preminumCp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_HistoryCp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"serviceNm\" type=\"STRING\" size=\"256\"/><Column id=\"procInCd\" type=\"STRING\" size=\"256\"/><Column id=\"procInNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsParams", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"mobNo\" type=\"string\" size=\"32\"/><Column id=\"cMileage\" type=\"bigdecimal\" size=\"16\"/><Column id=\"custNo\" type=\"string\" size=\"32\"/><Column id=\"ordNo\" type=\"string\" size=\"32\"/><Column id=\"matCd\" type=\"string\" size=\"32\"/><Column id=\"poscd\" type=\"string\" size=\"32\"/><Column id=\"equNo\" type=\"string\" size=\"32\"/><Column id=\"aMzileage\" type=\"string\" size=\"32\"/><Column id=\"chkStatNm\" type=\"string\" size=\"32\"/><Column id=\"cntNm\" type=\"string\" size=\"32\"/><Column id=\"carNo\" type=\"string\" size=\"32\"/><Column id=\"planDay\" type=\"string\" size=\"32\"/><Column id=\"matNm\" type=\"string\" size=\"32\"/><Column id=\"addr1\" type=\"string\" size=\"32\"/><Column id=\"planTm\" type=\"string\" size=\"32\"/><Column id=\"chkStat\" type=\"string\" size=\"32\"/><Column id=\"procTm\" type=\"string\" size=\"32\"/><Column id=\"addr2\" type=\"string\" size=\"32\"/><Column id=\"cntCd\" type=\"string\" size=\"32\"/><Column id=\"seq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"jobSeq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"custName\" type=\"string\" size=\"32\"/><Column id=\"telNo\" type=\"string\" size=\"32\"/><Column id=\"stdYm\" type=\"string\" size=\"32\"/><Column id=\"procDay\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_userInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"carmasterNu\" type=\"STRING\" size=\"256\"/><Column id=\"carmasterNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"etc1\" type=\"STRING\" size=\"256\"/><Column id=\"etc2\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_contractInfo", "absolute", "0", "64", "80", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_text("작업목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "0", "48", "1147", "20", null, null, this);
            obj.set_taborder("62");
            obj.set_text("h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Tab("tab_info", "absolute", "0", "334", "1122", "210", null, null, this);
            obj.set_taborder("82");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("false");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tab_info_chagne", this.tab_info);
            obj.set_text("정보변경");
            obj.set_url("cs::RTCSRegularCheck_tab_info_change.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info_result", this.tab_info);
            obj.set_text("미처리등록");
            obj.set_url("cs::RTCSRegularCheck_tab_info_result.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info_preminum", this.tab_info);
            obj.set_text("프리미엄서비스");
            obj.set_url("cs::RTCSRegularCheck_tab_info_preminum.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info_history", this.tab_info);
            obj.set_text("서비스이력");
            obj.set_url("cs::RTCSRegularCheck_tab_info_history.xfdl");
            this.tab_info.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1122", "0", "25", null, null, "0", this);
            obj.set_taborder("83");
            obj.set_text("w25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "1121", "382", "25", "150", null, null, this);
            obj.set_taborder("85");
            obj.set_text("h150");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_workList", "absolute", "0", "92", "1122", "188", null, null, this);
            obj.set_taborder("128");
            obj.set_binddataset("dsWorkList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"61\"/><Column size=\"72\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"88\"/><Column size=\"159\"/><Column size=\"46\"/><Column size=\"80\"/><Column size=\"97\"/><Column size=\"80\"/><Column size=\"92\"/><Column size=\"83\"/><Column size=\"80\"/><Column size=\"132\"/><Column size=\"136\"/><Column size=\"200\"/><Column size=\"85\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"예정일\"/><Cell col=\"1\" text=\"시간\"/><Cell col=\"2\" text=\"상태\"/><Cell col=\"3\" text=\"담당자\"/><Cell col=\"4\" text=\"처리일\"/><Cell col=\"5\" text=\"처리자\"/><Cell col=\"6\" text=\"시간\"/><Cell col=\"7\" text=\"계약번호\"/><Cell col=\"8\" text=\"고객명\"/><Cell col=\"9\" text=\"차량번호\"/><Cell col=\"10\" text=\"상품명\"/><Cell col=\"11\" text=\"본수\"/><Cell col=\"12\" text=\"주행거리\"/><Cell col=\"13\" text=\"주행거리(계약)\"/><Cell col=\"14\" text=\"장착일자\"/><Cell col=\"15\" text=\"핸드폰\"/><Cell col=\"16\" text=\"전화번호\"/><Cell col=\"17\" text=\"우편번호\"/><Cell col=\"18\" text=\"주소\"/><Cell col=\"19\" text=\"구주소\"/><Cell col=\"20\" text=\"상세주소\"/><Cell col=\"21\" text=\"전월연체여부\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"expr:planDay==&quot;&quot; ?&quot;&quot;:planDay.substring(0,4)+&quot;-&quot;+planDay.substring(4,6)+&quot;-&quot;+planDay.substring(6,8)\"/><Cell col=\"1\" text=\"expr:planTm==&quot;&quot;?&quot;&quot;:planTm.substring(0,2) + &quot;:&quot;+planTm.substring(2,4)\" maskchar=\" \"/><Cell col=\"2\" text=\"bind:chkStatNm\" maskchar=\"_\"/><Cell col=\"3\" text=\"bind:mrNm\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"none\" text=\"expr:procDay==&quot;&quot; ?&quot;&quot;:procDay.substring(0,4)+&quot;-&quot;+procDay.substring(4,6)+&quot;-&quot;+procDay.substring(6,8)\" maskchar=\" \"/><Cell col=\"5\" text=\"bind:rMrnm\"/><Cell col=\"6\" text=\"expr:procTm==&quot;&quot;?&quot;&quot;:procTm.substring(0,2) + &quot;:&quot;+procTm.substring(2,4)\"/><Cell col=\"7\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"8\" text=\"bind:custName\"/><Cell col=\"9\" text=\"bind:carNo\"/><Cell col=\"10\" text=\"bind:matNm\"/><Cell col=\"11\" text=\"bind:cntNm\"/><Cell col=\"12\" style=\"align:left;\" text=\"bind:aMzileage\"/><Cell col=\"13\" style=\"align:left;\" text=\"bind:cMileage\"/><Cell col=\"14\" displaytype=\"date\" text=\"bind:procDayb\"/><Cell col=\"15\" text=\"bind:mobNo\"/><Cell col=\"16\" text=\"bind:telNo\"/><Cell col=\"17\" text=\"bind:poscd\"/><Cell col=\"18\" style=\"align:left;\" text=\"bind:addr1\"/><Cell col=\"19\" style=\"align:left;\" text=\"bind:addr1Old\"/><Cell col=\"20\" style=\"align:left;\" text=\"bind:addr2\"/><Cell col=\"21\" text=\"bind:delyYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "48", null, null, this);
            obj.set_taborder("130");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "25", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_text("대상년월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "636", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("78");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "272", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_text("담당자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("mrCd", "absolute", "372", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_tooltiptext("edit");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ordNo", "absolute", "716", "12", "141", "21", null, null, this.div_search);
            obj.set_taborder("86");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save01", "absolute", "471", "12", "21", "21", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save00", "absolute", "74.6%", "12", "22", "21", null, null, this.div_search);
            obj.set_taborder("90");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("sdYm", "absolute", "105", "12", "142", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("91");
            obj.set_editformat("yyyy-MM");
            obj.set_dateformat("yyyy-MM");
            obj.set_value("null");
            obj.set_type("normal");
            obj = new Edit("mrNm", "absolute", "491", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("92");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_tooltiptext("edit");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "64", null, null, this.div_search);
            obj.set_taborder("93");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "8", "32", "1122", "12", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "247", "0", "25", "64", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "611", "0", "25", "64", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "82", "1147", "10", null, null, this);
            obj.set_taborder("131");
            obj.set_text("h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "290", "1147", "40", null, null, this);
            obj.set_taborder("132");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd", "absolute", "0", "290", "68", "31", null, null, this);
            obj.set_taborder("133");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("txt_hpNo", "absolute", "67", "290", "102", "31", null, null, this);
            obj.set_taborder("134");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd01", "absolute", "168", "290", "70", "31", null, null, this);
            obj.set_taborder("135");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("txt_telNo", "absolute", "237", "290", "95", "31", null, null, this);
            obj.set_taborder("136");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd03", "absolute", "331", "290", "71", "31", null, null, this);
            obj.set_taborder("137");
            obj.set_text("우편번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("txt_poscd", "absolute", "401", "290", "62", "31", null, null, this);
            obj.set_taborder("138");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd05", "absolute", "462", "290", "47", "31", null, null, this);
            obj.set_taborder("139");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("txt_addr1", "absolute", "508", "290", "235", "31", null, null, this);
            obj.set_taborder("140");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            obj.style.set_padding("0 2 0 2");
            obj.style.set_font("8 Dotum");
            this.addChild(obj.name, obj);

            obj = new Static("txt_addr2", "absolute", "876", "290", "246", "31", null, null, this);
            obj.set_taborder("141");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            obj.style.set_padding("0 2 0 2");
            obj.style.set_font("8 Dotum");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "280", "1147", "10", null, null, this);
            obj.set_taborder("142");
            obj.set_text("h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("txt_addr1Old", "absolute", "746", "290", "127", "31", null, null, this);
            obj.set_taborder("143");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            obj.style.set_padding("0 2 0 2");
            obj.style.set_font("8 Dotum");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 48, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("130");
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
            		p.set_classname("contractStatus");
            		p.set_titletext("점검 작업목록조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "cs::RTCSRegularCheck_tab_info_change.xfdl");
            this._addPreloadList("fdl", "cs::RTCSRegularCheck_tab_info_result.xfdl");
            this._addPreloadList("fdl", "cs::RTCSRegularCheck_tab_info_preminum.xfdl");
            this._addPreloadList("fdl", "cs::RTCSRegularCheck_tab_info_history.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTCSRegularCheck.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegularCheck.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSRegularCheck.xfdl
         * 설    명 : 정기점검 작업목록 조회
         * 작 성 자 : 
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-06-16	wjim		[20170616_01] '구주소' 추가
         ***************************************************************************************************/

        //include "lib::comLib.xjs";
        this.p_arg = "RTCSRegularCheck";

        //===========================================================================
        // 최초 화면 로드시 처리할 내용정의 
        //===========================================================================
        this.RTCSRegularCheck_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.div_search.sdYm.set_value( FN_today());
        	this.parent.setButton("E|S", this);
        	
        	if( application.gds_userInfo.getColumn(0, "userGrp") == "08" ){
        		this.div_search.btn_save01.set_visible(false);
        		
        		var userId = application.gds_userInfo.getColumn(0, "userId");
        		if( nvl(userId) != "" ){
        			this.ds_userInfo.clearData();
        			
        			var sSvcID        	= "selectUserInfo";                    
        			var sController   	= "rtms/cs/selectUserInfo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_userInfo=mapUserInfo";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("userId", userId);
        		}
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			
        	}else{
        		this.div_search.btn_save01.set_visible(true);
        	}
        }

        //===========================================================================
        // 계약번호조회를 위한 팝업호출
        //===========================================================================
        this.btn_orderNo_onclick = function(obj,e)
        {
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");	
        }

        this.returnOrderNoInfo = function(ordNo){
        	this.div_search.ordNo.set_value(ordNo);
        }

        //===========================================================================
        // 계약번호조회팝업의 결과값을 처리하기위한 함수
        //===========================================================================
        //this.returnOrderNoInfo = function(ordNo, birthDay, telNo){
        //	this.selectWorkList(ordNo);
        //}

        //===========================================================================
        // 미스터로디안 찾기 팝업호출
        //===========================================================================
        this.div_cust_btn_postSearch1_onclick = function(obj,e){
        	var args ={p_formId : "RTCSCarMaster"};
        	Ex.core.popup(this,"Mr. Roadian 찾기","cs::RTCSCarMaster_pop.xfdl",args, "modaless=false");
        }

        //===========================================================================
        // 미스터로디안 찾기 팝업결과
        //===========================================================================
        this.returnCarmaster = function(val1,val2){
        	this.div_search.mrCd.set_value(val1);
        	this.div_search.mrNm.set_value(val2);
        }

        //===========================================================================
        // 정기정검 작업목록조회
        //===========================================================================
        this.fn_search = function(){
        	var ordNo = nvl(this.div_search.ordNo.value);
        	var sdYm  = nvl(this.div_search.sdYm.value);
        	sdYm = sdYm.substring(0, 6);
        	var mrCd  = nvl(this.div_search.mrCd.value);
        	
        	if(sdYm == "") {
        		alert("대상년월은 필수입력항목 입니다.");
        		return;
        	}
        	
        	var sSvcID        	= "selectWorkList";                    
        	var sController   	= "rtms/cs/selectWorkList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsWorkList=out_work_list";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";

        	//this.FN_tabDataSetClear();
        	sArgs += Ex.util.setParam("ordNo", 	ordNo);
        	sArgs += Ex.util.setParam("sdYm", 	sdYm);
        	sArgs += Ex.util.setParam("mrCd", 	mrCd);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //===========================================================================
        // 엔터키 이벤트를 통한 계약리스트 팝업호출
        //===========================================================================
        this.ed_ordNo_onkeyup = function(obj,e) {
        	if(e.keycode == 13 ){	
        		var ordNo = nvl(this.ed_ordNo.value);
        			if( ordNo == "" ){
        			alert("계약번호를 입력하세요.");
        			return;
        		}else{
        			this.returnOrderNoInfo(ordNo);
        		}	
        	}
        }

        //===========================================================================
        // 텝페이지 변경 이벤트 발생시 공통 스크립트처리
        //===========================================================================
        this.tab_info_onchanged = function(obj,e) {
        	this.FN_tabDataSetClear();
        	this.FN_initTab( e.postindex );
        }

        //===========================================================================
        // 각텝페이지에 해당되는 데이타셋 초기화
        //===========================================================================
        this.FN_tabDataSetClear = function(){
        	this.dsChg.clearData();
        	this.ds_HistoryCp.clearData();
        	this.ds_preminumCp.clearData();
        	this.dsResult.clearData();
        	//this.tab_info.tab_info1_install.ds_install.clearData();
        }

        //===========================================================================
        // 그리드클릭시 정보변경, 처리결과, 프리미엄서비스, 서비스이력 조회
        //===========================================================================
        this.grd_workList_oncellclick = function(obj,e) {
        	var row = this.dsWorkList.rowposition;
        	//var cnt = this.dsWorkList.getColCount();
        	var str = "";

        	this.txt_hpNo.set_text(nvl(this.dsWorkList.getColumn(row, "mobNo")));
        	this.txt_telNo.set_text(nvl(this.dsWorkList.getColumn(row, "telNo")));
        	this.txt_poscd.set_text(nvl(this.dsWorkList.getColumn(row, "poscd")));
        	this.txt_addr1.set_text(nvl(this.dsWorkList.getColumn(row, "addr1")));
        	this.txt_addr1Old.set_text(nvl(this.dsWorkList.getColumn(row, "addr1Old")));
        	this.txt_addr2.set_text(nvl(this.dsWorkList.getColumn(row, "addr2")));
        	
        	this.FN_initTab(0);
        }

        //===========================================================================
        // 각 텝페이지에 해당되는 내용을 조회한다.
        //===========================================================================
        this.FN_initTab = function(postindex){
        	
        	var row    	= this.dsWorkList.rowposition;
        	//파라미터로 넘길 DataSetRow 처리
        	this.dsParams.deleteAll();
        	
        	if( this.dsWorkList.getRowCount() != 0 ){
        		var addRow = this.dsParams.addRow();
        		this.dsParams.copyRow(addRow, this.dsWorkList, row);
        	}
        			
        	var ordNo = nvl(this.dsWorkList.getColumn(this.dsWorkList.rowposition,"ordNo"));
        	
        	this.FN_tabDataSetClear();
        	if( postindex == 0 ){
        		if( this.dsParams.getRowCount() != 0 ){
        			this.tab_info.set_tabindex(0);
        			var sSvcID        	= "infoChange";                    
        			var sController   	= "rtms/cs/infoChange.do";
        			var sInDatasets   	= "param_chg=dsParams";
        			var sOutDatasets  	= "dsChg=out_chg";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}else if( postindex == 1 ){
        		if( this.dsParams.getRowCount() != 0 ){
        			var sSvcID        	= "infoResult";                    
        			var sController   	= "rtms/cs/infoResult.do";
        			var sInDatasets   	= "param_chg=dsParams";
        			var sOutDatasets  	= "dsResult=out_chg";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}else if( postindex == 2 ){
        		var row = this.dsWorkList.rowposition;
        		var preOrdNo = this.dsWorkList.getColumn(row, "ordNo");
        		
        		if( nvl(preOrdNo) != "" ){
        			var sSvcID        	= "listPreminum";                    
        			var sController   	= "rtms/sd/listPreminum.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_preminumCp=mapPreminum";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	preOrdNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}else if( postindex == 3 ){
        		if( ordNo != "" ){
        			var sSvcID        	= "serviceHistory";                    
        			var sController   	= "rtms/cs/serviceHistory.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_HistoryCp=mapHistory";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        }

        //===========================================================================
        // 요청에 대한 응답결과처리 및 메시지처리
        //===========================================================================
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        {
        	if (strSvcId == "selectWorkList"){
        		
        		this.FN_tabDataSetClear();
        		this.grd_workList_oncellclick();
        		
        		var cnt = this.dsWorkList.getRowCount();
        		//for(var i = 0; i<cnt; i++) {
        		//	if(nvl(this.dsWorkList.getColumn(i, "procDay")) == "") {
        		//		
        		//	}
        		//}
        		if( cnt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.grd_workList.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        		
        	}
        	
        	if (strSvcId == "infoChange"){
        		if( this.dsChg.rowcount != 0){
        			var nRow = this.dsChg.rowposition;
        			if( FN_numberHyphenInReturn(this.dsChg.getColumn(nRow, "mobNo")) != false ){
        				this.dsChg.setColumn(nRow, "mobNo", FN_numberHyphenInReturn(this.dsChg.getColumn(nRow, "mobNo")));
        			}
        			if( FN_numberHyphenInReturn(this.dsChg.getColumn(nRow, "telNo")) != false ){
        				this.dsChg.setColumn(nRow, "telNo", FN_numberHyphenInReturn(this.dsChg.getColumn(nRow, "telNo")));
        			}
        			this.tab_info.tab_info_chagne.subChange.copyData(this.dsChg);
        			
        			if( this.dsWorkList.getColumn(this.dsWorkList.rowposition,"chkStat") == "04" ){
        				this.tab_info.tab_info_chagne.change_save.set_enable(false);
        			}else{
        				this.tab_info.tab_info_chagne.change_save.set_enable(true);
        			}
        		}
        	}
        	
        	if (strSvcId == "infoResult"){
        		this.tab_info.tab_info_result.subResult.copyData(this.dsResult);
        		
        		if( this.dsWorkList.getColumn(this.dsWorkList.rowposition,"chkStat") == "04" ){
        			this.tab_info.tab_info_result.change_save.set_enable(false);
        		}else{
        			this.tab_info.tab_info_result.change_save.set_enable(true);
        		}
        	}
        	
        	if(strSvcId == "listPreminum"){
        		this.tab_info.tab_info_preminum.ds_preminum.copyData(this.ds_preminumCp);
        	}
        	
        	if(strSvcId == "serviceHistory"){
        		this.tab_info.tab_info_history.ds_History.copyData(this.ds_HistoryCp);
        		
        		if( this.userGrp == "01" ){
         			this.tab_info.tab_info_history.btn_rollBack.set_visible(true);
         		}
        	}
        	
        	if(strSvcId == "selectUserInfo"){
        		var ct = this.ds_userInfo.rowcount;
        		if( ct != 0 ){
        			this.div_search.mrCd.set_value( this.ds_userInfo.getColumn(0,"carmasterNu") );
        			this.div_search.mrNm.set_value( this.ds_userInfo.getColumn(0,"carmasterNm") );
        		}
        	}
        }

        this.fn_excel = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.grd_workList, "리스트");
        }

        
        this.div_search_Ed_emNm_onkeyup = function(obj,e)
        {
        if( e.keycode == "13" ){
        	this.fn_search();
        }
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSRegularCheck_onload, this);
            this.tab_info.addEventHandler("onchanged", this.tab_info_onchanged, this);
            this.grd_workList.addEventHandler("oncellclick", this.grd_workList_oncellclick, this);
            this.div_search.mrCd.addEventHandler("onkeyup", this.div_search_Ed_ctNm_onkeyup, this);
            this.div_search.ordNo.addEventHandler("onkeyup", this.div_search_Ed_emNm_onkeyup, this);
            this.div_search.btn_save01.addEventHandler("onclick", this.div_cust_btn_postSearch1_onclick, this);
            this.div_search.btn_save00.addEventHandler("onclick", this.btn_orderNo_onclick, this);
            this.div_search.mrNm.addEventHandler("onkeyup", this.div_search_Ed_ctNm_onkeyup, this);

        };

        this.loadIncludeScript("RTCSRegularCheck.xfdl");
        this.loadPreloadList();
       
    };
}
)();
