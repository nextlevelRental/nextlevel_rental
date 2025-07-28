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
                this.set_name("RTCSKeepHistory");
                this.set_classname("RTCSKeepHistory");
                this.set_titletext("보관내역 조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtcs0203", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"strgSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"custMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"srrgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgYn\" type=\"STRING\" size=\"256\"/><Column id=\"strgStat\" type=\"STRING\" size=\"256\"/><Column id=\"strgStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"srsvYn\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehNm\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"strgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgDt\" type=\"STRING\" size=\"256\"/><Column id=\"strgMthd\" type=\"STRING\" size=\"256\"/><Column id=\"strgMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"strgFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"strgFileName\" type=\"STRING\" size=\"256\"/><Column id=\"strgUserId\" type=\"STRING\" size=\"256\"/><Column id=\"strgUserNm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDt\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFileName\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrUserId\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrUserNm\" type=\"STRING\" size=\"256\"/><Column id=\"mfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfNm\" type=\"STRING\" size=\"256\"/><Column id=\"patternCd\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"tireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdF\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmF\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdF\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthF\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioF\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesF\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingF\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntF\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdR\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmR\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdR\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthR\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioR\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesR\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingR\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntR\" type=\"STRING\" size=\"256\"/><Column id=\"totTireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtcs0203Cp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"strgSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"custMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"srrgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgYn\" type=\"STRING\" size=\"256\"/><Column id=\"strgStat\" type=\"STRING\" size=\"256\"/><Column id=\"strgStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"srsvYn\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehNm\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"strgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgDt\" type=\"STRING\" size=\"256\"/><Column id=\"strgMthd\" type=\"STRING\" size=\"256\"/><Column id=\"strgMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"strgFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"strgFileName\" type=\"STRING\" size=\"256\"/><Column id=\"strgUserId\" type=\"STRING\" size=\"256\"/><Column id=\"strgUserNm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDt\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFileName\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrUserId\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrUserNm\" type=\"STRING\" size=\"256\"/><Column id=\"mfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfNm\" type=\"STRING\" size=\"256\"/><Column id=\"patternCd\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"tireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdF\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmF\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdF\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthF\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioF\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesF\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingF\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntF\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdR\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmR\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdR\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthR\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioR\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesR\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingR\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntR\" type=\"STRING\" size=\"256\"/><Column id=\"totTireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_strgStat", this);
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

            obj = new Dataset("ds_strgMthd", this);
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


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1122", "100", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "378", "10", "90", "21", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("대리점코드");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_ordNo", "absolute", "8", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "347", "0", "30", "96", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "30", "1118", "6", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "88", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_ordNo", "absolute", "207", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "468", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_maxlength("15");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_strgDay", "absolute", "758", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_text("보관기간");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "728", "0", "30", "96", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "8", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_text("고객코드");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "88", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("39");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_warehCd", "absolute", "378", "36", "90", "21", null, null, this.div_search);
            obj.set_taborder("40");
            obj.set_text("창고코드");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_warehCd", "absolute", "468", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("41");
            obj.set_maxlength("15");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_dlvrDay", "absolute", "758", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("42");
            obj.set_text("출고기간");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "8", "63", "80", "21", null, null, this.div_search);
            obj.set_taborder("44");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "88", "63", "120", "21", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_strgStat", "absolute", "378", "63", "90", "21", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_text("보관상태");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_strgMthd", "absolute", "758", "63", "120", "21", null, null, this.div_search);
            obj.set_taborder("48");
            obj.set_text("보관증수령방법");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_strgMthd", "absolute", "878", "63", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("49");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_strgMthd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static01", "absolute", "0", "57", "1118", "6", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "84", "1118", "12", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "227", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_custNo", "absolute", "207", "35", "21", "21", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_agencyCd", "absolute", "587", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "608", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_warehCd", "absolute", "587", "35", "21", "21", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_warehNm", "absolute", "608", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_strgStat", "absolute", "468", "63", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("58");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_strgStat");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Calendar("cal_strgDayStart", "absolute", "878", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("59");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "983", "10", "9", "21", null, null, this.div_search);
            obj.set_taborder("60");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_strgDayEnd", "absolute", "998", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("61");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("cal_dlvrDayStart", "absolute", "878", "36", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("62");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static05", "absolute", "983", "36", "9", "21", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_dlvrDayEnd", "absolute", "998", "36", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("64");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "100", "1147", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "116", "169", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "131", "1147", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0203", "absolute", "0", "141", "1122", null, null, "10", this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_rtcs0203");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"160\"/><Column size=\"160\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"보관순번\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"차량번호\"/><Cell col=\"5\" text=\"대리점명\"/><Cell col=\"6\" text=\"창고명\"/><Cell col=\"7\" text=\"보관상태\"/><Cell col=\"8\" text=\"보관일자\"/><Cell col=\"9\" text=\"출고일자\"/><Cell col=\"10\" text=\"타이어개수\"/><Cell col=\"11\" text=\"보관증수령방법\"/><Cell col=\"12\" text=\"서비스적용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:strgSeq\"/><Cell col=\"2\" text=\"bind:custNo\"/><Cell col=\"3\" text=\"bind:custNm\"/><Cell col=\"4\" text=\"bind:carNo\"/><Cell col=\"5\" text=\"bind:agencyNm\"/><Cell col=\"6\" text=\"bind:warehNm\"/><Cell col=\"7\" text=\"bind:strgStatNm\"/><Cell col=\"8\" displaytype=\"date\" edittype=\"none\" text=\"bind:strgDay\" calendardisplaynulltype=\"none\"/><Cell col=\"9\" displaytype=\"date\" edittype=\"none\" text=\"bind:dlvrDay\" calendardisplaynulltype=\"none\"/><Cell col=\"10\" text=\"bind:totTireCnt\"/><Cell col=\"11\" text=\"bind:strgMthdNm\"/><Cell col=\"12\" text=\"bind:srsvYn\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align:right;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\" style=\"align:right;\"/><Cell col=\"8\" style=\"align:right;\"/><Cell col=\"9\" style=\"align:right;\"/><Cell col=\"10\" style=\"align:right;\"/><Cell col=\"11\" style=\"align:right;\"/><Cell col=\"12\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_strg", "absolute", "939", "110", "41", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_text("보관");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_dlvr", "absolute", "985", "110", "41", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("출고");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_strgReceipt", "absolute", "1035", "110", "41", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_text("보관증");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_dlvrReceipt", "absolute", "1081", "110", "41", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_text("출고증");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new FileDownload("FileDownload", "absolute", "824", "110", "100", "21", null, null, this);
            obj.set_taborder("10");
            obj.getSetter("retry").set("0");
            obj.set_text("파일다운로드");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 100, this.div_search,
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
            		p.set_classname("RTCSKeepHistory");
            		p.set_titletext("보관내역 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSKeepHistory.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSKeepHistory.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 	 = "RTCSKeepHistory";
        this.userGrp = application.gds_userInfo.getColumn(0,"userGrp");	//01 : 영업관리자//02 : 콜센터//03 : 지사//04 : 지점	//05 : 대리점
        this.agentId = application.gds_userInfo.getColumn(0,"agentId");	//01 : 영업관리자//02 : 콜센터//03 : 지사//04 : 지점	//05 : 대리점
        this.agentNm = application.gds_userInfo.getColumn(0,"agentNm");	//01 : 영업관리자//02 : 콜센터//03 : 지사//04 : 지점	//05 : 대리점
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 	 = "";													//현재날짜
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        	
        	if( strSvcId == "initRTCSKeepHistory" ){
        		var strgStatCnt = this.ds_strgStat.getRowCount();
        		var strgMthd = this.ds_strgMthd.getRowCount();
        		if( strgStatCnt > 0 ){
        			var insert = this.ds_strgStat.insertRow( 0 );
        			this.ds_strgStat.setColumn(insert,"cd"," ");
        			this.ds_strgStat.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_strgStat.set_value( " " );
        		}
        		if( strgMthd > 0 ){
        			var insert = this.ds_strgMthd.insertRow( 0 );
        			this.ds_strgMthd.setColumn(insert,"cd"," ");
        			this.ds_strgMthd.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_strgMthd.set_value( " " );
        		}
        	}
        	
        	if( strSvcId == "getToday" ){
        		if( nvl(this.toDay) != "" ){
        			if( nvl(this.toDay).length == 8 ){
        				var yyyy = this.toDay.substr(0,4);
        				var mm = this.toDay.substr(4,2);
        				var dd = this.toDay.substr(6,2);
        				var formatDay = yyyy+"-"+mm+"-"+dd;
        				
        				var firstDate = new Date(formatDay);
        				firstDate.setMonth(firstDate.getMonth()-1);
        				firstDate.setDate(1);
        				firstDate = this.converDateString(firstDate);
        				
        				var lastDate = new Date(formatDay);
        				lastDate.setMonth( lastDate.getMonth() );
        				lastDate.setDate(0);
        				lastDate = this.converDateString(lastDate);
        				
        				//this.div_search.cal_strgDayStart.set_value( firstDate );
        				//this.div_search.cal_strgDayEnd.set_value( lastDate );
        			}
        		}
        	}
        	
        	if( strSvcId == "selectRTCSKeepHistory" ){
        		if( nErrorCode == "0" ){
        			var nRowCount = this.ds_rtcs0203.getRowCount();
        			if(nRowCount != 0){
        				
        			}else{
        				alert("조회된 데이터가 없습니다.");
        				this.grid_rtcs0203.set_nodatatext("조회된 데이터가 없습니다.");
        				this.div_search.ed_ordNo.setFocus(true);
        			}
        		}else{
        			alert(strErrorMsg);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.converDateString = function(date){
        	return date.getFullYear()+this.addZero(eval(date.getMonth()+1))+this.addZero(date.getDate());
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.addZero = function(i){
        	var rtn = i + 100;
        	return rtn.toString().substring(1,3);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCSKeepHistory_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.parent.setButton("E|S", this);
        	this.fn_init();
        }
        this.fn_init = function(){
        	if( this.userGrp == "01" ){
        		this.div_search.ed_agencyCd.set_enable(true);
        		this.btn_strg.set_enable(true);
        		this.btn_dlvr.set_enable(true);
        	}else{
        		this.btn_strg.set_enable(false);
        		this.btn_dlvr.set_enable(false);
        		
        		if( this.userGrp == "05" ){
        			this.div_search.ed_agencyCd.set_value(this.agentId);
        			this.div_search.ed_agencyNm.set_value(this.agentNm);
        			this.div_search.bt_agencyCd.set_enable(false);
        		}
        	}
        	
        	var sSvcID      	= "initRTCSKeepHistory";  
        	var sController   	= "rtms/cs/initRTCSKeepHistory.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_strgStat=mapStrgStat ";
        	sOutDatasets += " ds_strgMthd=mapStrgMthd ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	Ex.core.exportExcel(this, this.grid_rtcs0203);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var ordNo 			= nvl(this.div_search.ed_ordNo.value);
        	var agencyCd  		= nvl(this.div_search.ed_agencyCd.value);
        	var strgDayStart 	= nvl(this.div_search.cal_strgDayStart.value);
        	var strgDayEnd  	= nvl(this.div_search.cal_strgDayEnd.value);
        	var custNo 			= nvl(this.div_search.ed_custNo.value);
        	var warehCd  		= nvl(this.div_search.ed_warehCd.value);
        	var dlvrDayStart 	= nvl(this.div_search.cal_dlvrDayStart.value);
        	var dlvrDayEnd  	= nvl(this.div_search.cal_dlvrDayEnd.value);
        	var carNo 			= nvl(this.div_search.ed_carNo.value);
        	var strgStat  		= nvl(this.div_search.cb_strgStat.value);
        	var strgMthd  		= nvl(this.div_search.cb_strgMthd.value);
        	var userId  = application.gds_userInfo.getColumn(0, "userId"); //사용자ID

        	if( (ordNo == "") && (custNo == "") && (carNo == "") && (agencyCd == "") ){
        		if( (agencyCd == "") && (this.userGrp != "01") ){
        			alert("대리점코드는 필수 입니다.");
        			return false;
        		}
        	}
        	
        	if( strgDayStart != "" ){
        		if( strgDayEnd == "" ){
        			alert( "보관기간 값이 없습니다." );
        			this.div_search.cal_strgDayEnd.setFocus(true);
        			return false;
        		}
        		if( (strgDayStart > strgDayEnd) ){
        			alert( "보관기간을 다시 확인해주세요." );
        			this.div_search.cal_strgDayEnd.setFocus(true);
        			return false;
        		}
        	}
        	
        	if( dlvrDayStart != "" ){
        		if( dlvrDayEnd == "" ){
        			alert( "출고기간 값이 없습니다." );
        			this.div_search.cal_dlvrDayEnd.setFocus(true);
        			return false;
        		}
        		if( dlvrDayStart > dlvrDayEnd ){
        			alert( "출고기간 다시 확인해주세요." );
        			this.div_search.cal_dlvrDayEnd.setFocus(true);
        			return false;
        		}
        	}
        	
        	var sSvcID        	= "selectRTCSKeepHistory";                    
        	var sController   	= "rtms/cs/selectRTCSKeepHistory.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtcs0203=mapRtcs0203";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("strgDayStart", strgDayStart);
        	sArgs += Ex.util.setParam("strgDayEnd", strgDayEnd);
        	sArgs += Ex.util.setParam("custNo", custNo);
        	sArgs += Ex.util.setParam("warehCd", warehCd);
        	sArgs += Ex.util.setParam("dlvrDayStart", dlvrDayStart);
        	sArgs += Ex.util.setParam("dlvrDayEnd", dlvrDayEnd);
        	sArgs += Ex.util.setParam("carNo", carNo);
        	sArgs += Ex.util.setParam("strgStat", strgStat);
        	sArgs += Ex.util.setParam("strgMthd", strgMthd);
        	sArgs += Ex.util.setParam("userId", userId);
        	this.ds_rtcs0203.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_ordNo_onclick = function(obj,e){
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }
        this.returnOrderNo = function(ordNo){
        	this.div_search.ed_ordNo.set_value(ordNo);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_agencyCd_onclick = function(obj,e){
        	var args = {p_arg : this.p_arg};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this.returnAgencyCd = function(res) {
        	this.div_search.ed_agencyCd.set_value( res[0] );
        	this.div_search.ed_agencyNm.set_value( res[1] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_custNo_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustNo = function(res){
        	this.div_search.ed_custNo.set_value( res[0] );
        	this.div_search.ed_custNm.set_value( res[1] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_warehCd_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"창고 조회","comm::RTCOMMWarehouse_pop.xfdl",args, "modaless=false");
        }
        this.returnWarehCd = function(res ){
        	this.div_search.ed_warehCd.set_value( res[0] );
        	this.div_search.ed_warehNm.set_value( res[1] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_strg_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"보관등록","comm::RTCOMMStrgRegister.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_dlvr_onclick = function(obj,e){
        	this.ds_rtcs0203Cp.clearData();
        	var copyRow = this.ds_rtcs0203.rowposition;
        	var dlvrDay = nvl( this.ds_rtcs0203.getColumn(copyRow, "dlvrDay") );
        	if( copyRow != -1){
        		if( dlvrDay == "" ){
        			var addRow   = this.ds_rtcs0203Cp.addRow();
        			var copySucc = this.ds_rtcs0203Cp.copyRow(addRow,this.ds_rtcs0203,copyRow);
        			if( copySucc ){
        				var args ={p_arg : this.ds_rtcs0203Cp};
        				Ex.core.popup(this,"출고등록","comm::RTCOMMDlvrRegister.xfdl",args, "modaless=false");
        			}else{
        				alert("SYSTEM ERROR");
        			}
        		}else{
        			alert("보관 중인 대상이 존재하지 않아서 출고 처리할 수 없습니다.");
        		}	
        	}else{
        		alert("출고 등록할 정보를 선택해주세요.");
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_strgReceipt_onclick = function(obj,e){
        	var nRow 	= this.ds_rtcs0203.rowposition;
        	if( nRow != -1 ){
        		var ordNo 		 = nvl(this.ds_rtcs0203.getColumn(nRow, "ordNo"));
        		var strgSeq 	 = nvl(this.ds_rtcs0203.getColumn(nRow, "strgSeq"));
        		var strgFilePath = nvl(this.ds_rtcs0203.getColumn(nRow, "strgFilePath"));
        		var strgFileName = nvl(this.ds_rtcs0203.getColumn(nRow, "strgFileName"));
        		
        		if( (ordNo != "") && (strgSeq != "") && (strgFilePath != "") &&(strgFileName != "") ){
        			var sFileUrl = "/ntrms/cs/strgSRtcs0203FilePathName.do?ordNo="+ordNo+"&strgSeq="+strgSeq;
        			this.FileDownload.set_downloadurl(sFileUrl);
        			var bSucc = this.FileDownload.download();
        		}else{
        			if( (ordNo == "") && (strgSeq == "") ){
        				alert("계약번호,보관순번 정보를 확인하세요.");
        				return false;
        			}else{
        				alert("보관증 파일이 없습니다.");
        				return false;
        			}
        		}
        	}else{
        		alert("보관증 정보를 선택해주세요.");
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_dlvrReceipt_onclick = function(obj,e){
        	var nRow 	= this.ds_rtcs0203.rowposition;
        	if( nRow != -1 ){
        		var ordNo 		 = nvl(this.ds_rtcs0203.getColumn(nRow, "ordNo"));
        		var strgSeq 	 = nvl(this.ds_rtcs0203.getColumn(nRow, "strgSeq"));
        		var dlvrFilePath = nvl(this.ds_rtcs0203.getColumn(nRow, "dlvrFilePath"));
        		var dlvrFileName = nvl(this.ds_rtcs0203.getColumn(nRow, "dlvrFileName"));
        		
        		if( (ordNo != "") && (strgSeq != "") && (dlvrFilePath != "") && (dlvrFileName != "") ){
        			var sFileUrl = "/ntrms/cs/dlvrSRtcs0203FilePathName.do?ordNo="+ordNo+"&strgSeq="+strgSeq;
        			this.FileDownload.set_downloadurl(sFileUrl);
        			var bSucc = this.FileDownload.download();
        		}else{
        			if( (ordNo == "") && (strgSeq == "") ){
        				alert("계약번호,보관순번 정보를 확인하세요.");
        				return false;
        			}else{
        				alert("출고증 파일이 없습니다.");
        				return false;
        			}
        		}
        	}else{
        		alert("출고증 정보를 선택해주세요.");
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_rtcs0203_oncelldblclick = function(obj,e){
        	
        	this.ds_rtcs0203Cp.clearData();
        	var copyRow = this.ds_rtcs0203.rowposition;
        	if( copyRow != -1){
        		var addRow   = this.ds_rtcs0203Cp.addRow();
        		var copySucc = this.ds_rtcs0203Cp.copyRow(addRow,this.ds_rtcs0203,copyRow);
        		if( copySucc ){
        			var args ={p_arg : this.ds_rtcs0203Cp};
        			Ex.core.popup(this,"보관상품내역","comm::RTCOMMStorageProductHistory.xfdl",args, "modaless=false");
        		}else{
        			alert("SYSTEM ERROR");
        		}
        	}else{
        		alert("보관상품 내역을 다시 확인해주세요.");
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_agencyCd_onchanged = function(obj,e){
        	this.div_search.ed_agencyNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_custNo_onchanged = function(obj,e){
        	this.div_search.ed_custNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_warehCd_onchanged = function(obj,e){
        	this.div_search.ed_warehNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FNstrgSave = function(ordNo,agencyCd,agencyNm,strgDay,custNo,custNm,warehCd,warehNm,carNo,strgStat,strgMthd){
        	this.div_search.ed_ordNo.set_value( ordNo );
        	this.div_search.ed_agencyCd.set_value( agencyCd );
        	this.div_search.ed_agencyNm.set_value( agencyNm );
        	this.div_search.cal_strgDayStart.set_value( strgDay );
        	this.div_search.cal_strgDayEnd.set_value( strgDay );
        	this.div_search.cal_dlvrDayStart.set_value( "" );
        	this.div_search.cal_dlvrDayEnd.set_value( "" );
        	this.div_search.ed_custNo.set_value( custNo );
        	this.div_search.ed_custNm.set_value( custNm );
        	this.div_search.ed_warehCd.set_value( warehCd );
        	this.div_search.ed_warehNm.set_value( warehNm );
        	this.div_search.ed_carNo.set_value( carNo );
        	this.div_search.cb_strgStat.set_value( strgStat );
        	this.div_search.cb_strgMthd.set_value( strgMthd );
        	this.fn_search();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FNdlvrSave = function(ordNo,agencyCd,agencyNm,dlvrDay,custNo,custNm,warehCd,warehNm,carNo,strgStat,strgMthd){
        	this.div_search.ed_ordNo.set_value( ordNo );
        	this.div_search.ed_agencyCd.set_value( agencyCd );
        	this.div_search.ed_agencyNm.set_value( agencyNm );
        	this.div_search.cal_strgDayStart.set_value( "" );
        	this.div_search.cal_strgDayEnd.set_value( "" );
        	this.div_search.cal_dlvrDayStart.set_value( dlvrDay );
        	this.div_search.cal_dlvrDayEnd.set_value( dlvrDay );
        	this.div_search.ed_custNo.set_value( custNo );
        	this.div_search.ed_custNm.set_value( custNm );
        	this.div_search.ed_warehCd.set_value( warehCd );
        	this.div_search.ed_warehNm.set_value( warehNm );
        	this.div_search.ed_carNo.set_value( carNo );
        	this.div_search.cb_strgStat.set_value( strgStat );
        	this.div_search.cb_strgMthd.set_value( strgMthd );
        	this.fn_search();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSKeepHistory_onload, this);
            this.div_search.bt_ordNo.addEventHandler("onclick", this.div_search_bt_ordNo_onclick, this);
            this.div_search.ed_agencyCd.addEventHandler("onchanged", this.div_search_ed_agencyCd_onchanged, this);
            this.div_search.ed_custNo.addEventHandler("onchanged", this.div_search_ed_custNo_onchanged, this);
            this.div_search.ed_warehCd.addEventHandler("onchanged", this.div_search_ed_warehCd_onchanged, this);
            this.div_search.bt_custNo.addEventHandler("onclick", this.div_search_bt_custNo_onclick, this);
            this.div_search.bt_agencyCd.addEventHandler("onclick", this.div_search_bt_agencyCd_onclick, this);
            this.div_search.bt_warehCd.addEventHandler("onclick", this.div_search_bt_warehCd_onclick, this);
            this.grid_rtcs0203.addEventHandler("onselectchanged", this.grid_rtcs0200_onselectchanged, this);
            this.grid_rtcs0203.addEventHandler("oncelldblclick", this.grid_rtcs0203_oncelldblclick, this);
            this.btn_strg.addEventHandler("onclick", this.btn_strg_onclick, this);
            this.btn_dlvr.addEventHandler("onclick", this.btn_dlvr_onclick, this);
            this.btn_strgReceipt.addEventHandler("onclick", this.btn_strgReceipt_onclick, this);
            this.btn_dlvrReceipt.addEventHandler("onclick", this.btn_dlvrReceipt_onclick, this);

        };

        this.loadIncludeScript("RTCSKeepHistory.xfdl");

       
    };
}
)();
