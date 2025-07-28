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
                this.set_name("RTCDContract");
                this.set_classname("RTCMClaim");
                this.set_titletext("청구스케줄조회 -계약별");
                this.set_scrollbars("autoboth");
                this._setFormPosition(0,0,1147,690);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsSdStaus", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsSdListDetail", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"INT\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"INT\" size=\"256\"/><Column id=\"scdStat\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"INT\" size=\"256\"/><Column id=\"saleNamt\" type=\"INT\" size=\"256\"/><Column id=\"saleVamt\" type=\"INT\" size=\"256\"/><Column id=\"recpAmt\" type=\"INT\" size=\"256\"/><Column id=\"arreAmt\" type=\"INT\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"zlspr\" type=\"STRING\" size=\"256\"/><Column id=\"rcDay\" type=\"STRING\" size=\"256\"/><Column id=\"taxDt\" type=\"STRING\" size=\"256\"/><Column id=\"taxNo\" type=\"STRING\" size=\"256\"/><Column id=\"canclDay\" type=\"STRING\" size=\"256\"/><Column id=\"begDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"notamt\" type=\"INT\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsSdList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"INT\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"INT\" size=\"256\"/><Column id=\"monAmt\" type=\"INT\" size=\"256\"/><Column id=\"custNm\" type=\"INT\" size=\"256\"/><Column id=\"modelNm\" type=\"INT\" size=\"256\"/><Column id=\"carNo\" type=\"INT\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid01", "absolute", "0", "381", "1122", "309", null, null, this);
            obj.set_taborder("4");
            obj.set_autofittype("none");
            obj.set_binddataset("dsSdListDetail");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"160\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"청구순번\"/><Cell col=\"2\" text=\"청구구분\"/><Cell col=\"3\" text=\"청구회차\"/><Cell col=\"4\" text=\"스케줄상태\"/><Cell col=\"5\" text=\"매출금액\"/><Cell col=\"6\" text=\"공급가\"/><Cell col=\"7\" text=\"부가세\"/><Cell col=\"8\" text=\"수납금액\"/><Cell col=\"9\" text=\"미납금액\"/><Cell col=\"10\" text=\"청구일자\"/><Cell col=\"11\" text=\"청구보류\"/><Cell col=\"12\" text=\"수납일자\"/><Cell col=\"13\" text=\"세금계산서발행일자(예정)\"/><Cell col=\"14\" text=\"세금계산서번호\"/><Cell col=\"15\" text=\"중도완납일\"/><Cell col=\"16\" text=\"시작일\"/><Cell col=\"17\" text=\"종료일\"/><Cell col=\"18\" text=\"기산일\"/><Cell col=\"19\" text=\"미도래원금\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:schdSeq\"/><Cell col=\"2\" text=\"bind:recpTpNm\"/><Cell col=\"3\" text=\"bind:recpNu\"/><Cell col=\"4\" text=\"bind:scdStat\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:saleAmt\"/><Cell col=\"6\" style=\"align:right;\" text=\"bind:saleNamt\"/><Cell col=\"7\" style=\"align:right;\" text=\"bind:saleVamt\"/><Cell col=\"8\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"9\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"10\" displaytype=\"date\" text=\"bind:demdDt\" calendardisplaynulltype=\"none\"/><Cell col=\"11\" text=\"bind:zlspr\"/><Cell col=\"12\" displaytype=\"date\" text=\"bind:rcDay\" calendardisplaynulltype=\"none\"/><Cell col=\"13\" displaytype=\"date\" text=\"bind:taxDt\" calendardisplaynulltype=\"none\"/><Cell col=\"14\" text=\"bind:taxNo\"/><Cell col=\"15\" displaytype=\"date\" text=\"bind:canclDay\" calendardisplaynulltype=\"none\"/><Cell col=\"16\" displaytype=\"date\" text=\"bind:begDay\" calendardisplaynulltype=\"none\"/><Cell col=\"17\" displaytype=\"date\" text=\"bind:endDay\" calendardisplaynulltype=\"none\"/><Cell col=\"18\" displaytype=\"date\" text=\"bind:zfbDay\" calendardisplaynulltype=\"none\"/><Cell col=\"19\" displaytype=\"number\" style=\"align:right;\" text=\"bind:notamt\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleNamt&quot;)\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleVamt&quot;)\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;recpAmt&quot;)\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;arreAmt&quot;)\"/><Cell col=\"10\" style=\"align:right;\"/><Cell col=\"11\" style=\"align:right;\"/><Cell col=\"12\" style=\"align:right;\"/><Cell col=\"13\" style=\"align:right;\"/><Cell col=\"14\" style=\"align:right;\"/><Cell col=\"15\" style=\"align:right;\"/><Cell col=\"16\" style=\"align:right;\"/><Cell col=\"17\" style=\"align:right;\"/><Cell col=\"18\" style=\"align:right;\"/><Cell col=\"19\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;endDay&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "100", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "25", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpNm", "absolute", "225", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpCd", "absolute", "105", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save00", "absolute", "205", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburCd", "absolute", "450", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save01", "absolute", "549", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburNm", "absolute", "570", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("59");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "715", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("60");
            obj.set_text("장착대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcCd", "absolute", "795", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save02", "absolute", "893", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcNm", "absolute", "914", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "370", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("76");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "25", "36", "80", "20", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("orderCd", "absolute", "105", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("78");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save04", "absolute", "205", "36", "21", "21", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "370", "36", "80", "20", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("custCd", "absolute", "450", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save03", "absolute", "549", "36", "21", "21", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("custNm", "absolute", "570", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("statCd", "absolute", "795", "63", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("85");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@dsSdStaus");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_text("전체");
            obj.set_index("0");
            obj = new Static("Static05", "absolute", "715", "63", "80", "20", null, null, this.div_search);
            obj.set_taborder("86");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "715", "36", "80", "20", null, null, this.div_search);
            obj.set_taborder("87");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt00", "absolute", "795", "36", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("88");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("dt01", "absolute", "924", "36", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("89");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "910", "36", "10", "21", null, null, this.div_search);
            obj.set_taborder("90");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("93");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "113", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "345", "0", "25", "96", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "690", "0", "25", "96", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "31", "1118", "6", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "57", "1118", "6", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "0", "84", "1118", "12", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "340", "1147", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "356", "169", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("청구스케줄 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "371", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "100", "1147", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "116", "169", "20", null, null, this);
            obj.set_taborder("12");
            obj.set_text("메인 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "131", "1147", "10", null, null, this);
            obj.set_taborder("13");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "141", "1122", "200", null, null, this);
            obj.set_taborder("14");
            obj.set_binddataset("dsSdList");
            obj.set_autofittype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"300\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"110\"/><Column size=\"110\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"계약번호\"/><Cell col=\"1\" text=\"계약상태\"/><Cell col=\"2\" text=\"장착일자\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"타이어본수\"/><Cell col=\"5\" text=\"계약기간\"/><Cell col=\"6\" text=\"등록비\"/><Cell col=\"7\" text=\"월렌탈료\"/><Cell col=\"8\" text=\"고객명\"/><Cell col=\"9\" text=\"차종\"/><Cell col=\"10\" text=\"차량번호\"/><Cell col=\"11\" text=\"렌탈지사명\"/><Cell col=\"12\" text=\"렌탈지점명\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:statNm\"/><Cell col=\"2\" displaytype=\"date\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" text=\"bind:matNm\"/><Cell col=\"4\" text=\"bind:cntNm\"/><Cell col=\"5\" text=\"bind:periodNm\"/><Cell col=\"6\" style=\"align:right;\" text=\"bind:regiAmt\"/><Cell col=\"7\" style=\"align:right;\" text=\"bind:monAmt\"/><Cell col=\"8\" text=\"bind:custNm\"/><Cell col=\"9\" text=\"bind:modelNm\"/><Cell col=\"10\" text=\"bind:carNo\"/><Cell col=\"11\" text=\"bind:rentalGroupNm\"/><Cell col=\"12\" text=\"bind:rentalOfficeNm\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align:right;\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;regiAmt&quot;)\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;monAmt&quot;)\"/><Cell col=\"8\" style=\"align:right;\"/><Cell col=\"9\" style=\"align:right;\"/><Cell col=\"10\" style=\"align:right;\"/><Cell col=\"11\" style=\"align:right;\"/><Cell col=\"12\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "1122", "0", "25", "690", null, null, this);
            obj.set_taborder("15");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "1077", "115", "45", "22", null, null, this);
            obj.set_taborder("16");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "1077", "354", "45", "22", null, null, this);
            obj.set_taborder("17");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 95, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 690, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMClaim");
            		p.set_titletext("청구스케줄조회 -계약별");
            		p.set_scrollbars("autoboth");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","","","dsSdStaus","");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDContract.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDContract.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 청구스케줄조회(계약별)
         * 02. 그룹명   : RTSDCleim.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   : 2015.07.17
         * 05. 작성자   : 신정수
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
        this.nTotalCnt = 0;
        this.form_onload = function(obj,e)
        {
        	//폼로드시 공통함수 
        	Ex.core.init(obj);
        	this.DateDemo(); //오늘날짜, 첫날 세팅
        	this.comboInfo(); //계약상태 combox값 세팅
        	//this.fn_search();
        	this.fn_userRentalGroupInfo();
        	this.parent.setButton("S",this);
        	
        	var auth = Ex.core.o_auth;
        	if( auth.exptAuthYn == "N" ){
        		this.Button00.set_enable(false);
        		this.Button01.set_enable(false);
        	}
        }
        	
        //----------------------------------------------------------------------------------
        // Search: 사용자 렌탈그룹 조회
        //----------------------------------------------------------------------------------
        this.fn_userRentalGroupInfo = function()
        {
        	this.dsRentalInfo.clearData();
        	
        	var sSvcID        	= "userRentalGroupInfo";                    
        	var sController   	= "/rtms/sd/userRentalGroupInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsRentalInfo=ds_output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sArgs 			+= Ex.util.setParam("userId", application.gds_userInfo.getColumn(0, "userId"));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        	

        this.fn_init = function(){

        	var userId = application.gds_userInfo.getColumn(0, "userId"); 	//id
        	var userNm = application.gds_userInfo.getColumn(0, "userNm"); 	//이름
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	
        	var vkgrp = this.dsRentalInfo.getColumn(0, "rentalGroup"); 	//지사코드
        	var vkgrpNm = this.dsRentalInfo.getColumn(0, "rentalGroupNm"); //지사Nm
        	var vkbur = this.dsRentalInfo.getColumn(0, "rentalOffice"); 	//지점코드
        	var vkburNm = this.dsRentalInfo.getColumn(0, "rentalOfficeNm"); //지점NM
        	
        	var vkazc = application.gds_userInfo.getColumn(0, "vkazc");	 	//대리점
        	var vkazcNm = application.gds_userInfo.getColumn(0, "vkazcNm"); //대리점NM
        	
        	if(userGrp != '01' && userGrp != 'RM'){ 
        	
        		this.div_search.vkgrpCd.set_enable(false); 		//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		this.div_search.vkazcCd.set_enable(false); 		//장착대리점code 비활성
        		this.div_search.vkazcNm.set_enable(false); 		//장착대리점name 비활성
        		this.div_search.btn_save02.set_visible(false); 	//장착대리점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        		this.div_search.vkburCd.set_value(vkbur);
        		this.div_search.vkburNm.set_value(vkburNm);
        		this.div_search.vkazcCd.set_value(userId);	
        		this.div_search.vkazcNm.set_value(userNm);
        	}
        }
        		
        //지사
        this.showVkgrp = function(obj,e)
        {
          var args ={p_arg:"RTSDOrder"};
          Ex.core.popup(this,"지사 조회","comm::RTCOMMVkgrp_pop.xfdl",args,"modaless=false");
        }

        //지점
        this.showVkbur = function(obj,e)
        {
        	var args ={p_arg:"RTSDOrder", p_rentalGroup:this.div_search.vkgrpCd.value};
        	Ex.core.popup(this,"지점 조회","comm::RTCOMMVkbur_pop.xfdl",args,"modaless=false");
        }
        this._setReturn = function(val) {
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	if(gb == "vkgrp") {
        		this.div_search.vkgrpCd.set_value(cd);
        		this.div_search.vkgrpNm.set_value(nm);
        	} else if(gb == "vkbur" ) {
        		this.div_search.vkburCd.set_value(cd);
        		this.div_search.vkburNm.set_value(nm);
        	} else if(gb == "vkazc" ) {
        		this.div_search.vkazcCd.set_value(cd);
        		this.div_search.vkazcNm.set_value(nm);
        	}
        }

        //장착대리점
        this.showVkazc = function(obj,e)
        {
        	var args = {p_vkgrpCd:this.div_search.vkgrpCd.value, p_vkgrpNm:this.div_search.vkgrpNm.value, 
        				p_vkburCd:this.div_search.vkburCd.value, p_vkburNm:this.div_search.vkburNm.value, 
        				p_formId : "RTCMContract"};
        	Ex.core.popup(this,"대리점정보 검색","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this.return_agency = function(arr) {
        	this.div_search.vkgrpNm.set_value(arr[0]);
        	this.div_search.vkgrpCd.set_value(arr[1]);
        	this.div_search.vkburNm.set_value(arr[2]);
        	this.div_search.vkburCd.set_value(arr[3]);
        	this.div_search.vkazcNm.set_value(arr[4]);
        	this.div_search.vkazcCd.set_value(arr[5]);
        }

        //계약번호
        this.showVkorder = function(obj,e)
        {
        	var args ={p_arg:"RTSDContract"};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl", args ,"modaless=false");
        }
        this.returnOrderNoInfo = function(val) {
        	this.div_search.orderCd.set_value(val);
        }

        //고객번호
        this.showVkcus = function(obj,e)
        {
        	var args ={p_arg:"RTSDContract"};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(arr) {
        	var	custNo = arr[0].getColumn(0, "custNo");
        	var custNm = arr[0].getColumn(0, "custNm");
        	
        	this.div_search.custCd.set_value(custNo);
        	this.div_search.custNm.set_value(custNm);
        	
        }

        //combobox DATA값 세팅
        this.comboInfo = function(obj,e)
        {
        	var sSvcID        	= "contractService";
        	var sController   	= "/rtms/sd/comboInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsSdStaus=status";
        	var sArgs 			= "";	
        	var fn_callBack		= "";
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //조회버튼
        this.fn_search = function(obj,e)
        	{
        		var procFday 		= nvl(this.div_search.dt00.value); //장착일자 시작일
        		var procTday 		= nvl(this.div_search.dt01.value); //장착일자 마지막일
        		var salesGroup 		= ""; //지사
        		var salesOffice 	= ""; //지점
        		var agencyCd 		= nvl(this.div_search.vkazcCd.value); //장착대리점
        		var ordNo 			= nvl(this.div_search.orderCd.value); //계약번호
        		var custNo 			= nvl(this.div_search.custCd.value); //고객번호
        		var statCd 			= nvl(this.div_search.statCd.value); //스케쥴 상태코드
        		var rentalGroup 	= nvl(this.div_search.vkgrpCd.value); //렌탈지사
        		var rentalOffice 	= nvl(this.div_search.vkburCd.value); //렌탈지점
        		var userId          = application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        		
        		/* 렌탈지사지점 Check 해제 */
        // 		if (rentalGroup == "" || rentalGroup == null)
        // 		{
        // 			alert("렌탈지사를 선택하세요.");
        // 			return false;
        // 		}
        // 		if (rentalOffice == "" || rentalOffice == null)
        // 		{
        // 			alert("렌탈지점을 선택하세요.");
        // 			return false;
        // 		}
        	
        		var sSvcID        	= "contractList";                    
        		var sController   	= "/rtms/sd/listContract.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsSdList=contractInfo dsSdStaus=status";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("procFday", procFday);
        		sArgs += Ex.util.setParam("procTday", procTday);
        		sArgs += Ex.util.setParam("salesGroup", salesGroup);
        		sArgs += Ex.util.setParam("salesOffice", salesOffice);
        		sArgs += Ex.util.setParam("agencyCd", agencyCd);
        		sArgs += Ex.util.setParam("ordNo", ordNo);
        		sArgs += Ex.util.setParam("custNo", custNo);
        		sArgs += Ex.util.setParam("statCd", statCd);
        		sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        		sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        		sArgs += Ex.util.setParam("userId", userId);
        			
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        
        /* callBack함수 */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        		
        	if (strSvcId == "userRentalGroupInfo"){		
        	
        		if (this.dsRentalInfo.getColumn(0, "rentalGroup") == "" || this.dsRentalInfo.getColumn(0, "rentalGroup") == null) return;
        		
        		this.fn_init();
        	}
        	
        	if (strSvcId == "contractList") 
        	{
        		this.nTotalCnt = this.dsSdList.rowcount;
        		if(this.nTotalCnt == 0) {
        			this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
        		} else {
        			this.Grid00_oncellclick();
        		}
        	}
        }

        //오늘날짜와 오늘날짜 달의 첫날

        this.DateDemo = function(){

        	var obj, y, m, d, s = "";
        	obj = new Date();
        	s += obj.getFullYear();
        	m = obj.getMonth() + 1;
        	if(String(m).length == 1) {
        		m = "0" + m;
        	} 
        	s += m;
        	this.div_search.dt00.set_value(s + "01"); //첫날
        	d = obj.getDate();
        	s += d;
        	
        	this.div_search.dt01.set_value(s); //오늘날짜
        }

        
        this.Grid00_oncellclick = function(obj,e)
        {
        	
        	var ordNo 			= nvl(this.dsSdList.getColumn(this.dsSdList.rowposition, "ordNo")); //계약번호
        	var sSvcID        	= "contractListDetail";                    
        	var sController   	= "/rtms/sd/listContractDetail.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsSdListDetail=contractDetail";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        this.Button00_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.Grid00);
        }

        
        this.Button01_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.Grid01);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.btn_save00.addEventHandler("onclick", this.showVkgrp, this);
            this.div_search.btn_save01.addEventHandler("onclick", this.showVkbur, this);
            this.div_search.btn_save02.addEventHandler("onclick", this.showVkazc, this);
            this.div_search.btn_save04.addEventHandler("onclick", this.showVkorder, this);
            this.div_search.btn_save03.addEventHandler("onclick", this.showVkcus, this);
            this.div_search.statCd.addEventHandler("onitemchanged", this.div_search_statCd_onitemchanged, this);
            this.Grid00.addEventHandler("oncellclick", this.Grid00_oncellclick, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);

        };

        this.loadIncludeScript("RTSDContract.xfdl");

       
    };
}
)();
