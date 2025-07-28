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
                this.set_name("RTCOMMProductAndPrice_pop");
                this.set_classname("RTCOMMProductAndPrice_pop");
                this.set_titletext("상품 및 가격조회");
                this._setFormPosition(0,0,998,590);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_product", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"pettrenNm\" type=\"STRING\" size=\"256\"/><Column id=\"sizeNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"wheelQty\" type=\"STRING\" size=\"256\"/><Column id=\"weelLimitQty\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelFullNm\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"demmndQty\" type=\"STRING\" size=\"256\"/><Column id=\"pgCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"classSd\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_period", this);
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

            obj = new Dataset("ds_cnt", this);
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

            obj = new Dataset("ds_priceCp", this);
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

            obj = new Dataset("ds_seasonCd", this);
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

            obj = new Dataset("ds_petternCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_inchCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_combosetMat", this);
            obj._setContents("<ColumnInfo><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternNm\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_specCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_product", "absolute", "10", "92", "978", "250", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_product");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"160\"/><Column size=\"160\"/><Column size=\"160\"/><Column size=\"160\"/><Column size=\"160\"/><Column size=\"160\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계절구분\"/><Cell col=\"1\" text=\"패턴\"/><Cell col=\"2\" text=\"규격\"/><Cell col=\"3\" text=\"상품코드\"/><Cell col=\"4\" text=\"상품명\"/><Cell col=\"5\" text=\"바퀴수(장착가능수량)\"/></Band><Band id=\"body\"><Cell text=\"bind:seasonNm\" tooltiptext=\"bind:seasonNm\"/><Cell col=\"1\" text=\"bind:pettrenNm\" tooltiptext=\"bind:pettrenNm\"/><Cell col=\"2\" text=\"bind:sizeNm\" tooltiptext=\"bind:sizeNm\"/><Cell col=\"3\" text=\"bind:matCd\" tooltiptext=\"bind:matCd\"/><Cell col=\"4\" text=\"bind:matNm\" tooltiptext=\"bind:matNm\"/><Cell col=\"5\" text=\"bind:wheelQty\" tooltiptext=\"bind:wheelQty\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_price", "absolute", "10", "352", "978", "200", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_price");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"49\"/><Column size=\"100\"/><Column size=\"248\"/><Column size=\"110\"/><Column size=\"110\"/><Column size=\"42\"/><Column size=\"85\"/><Column size=\"95\"/><Column size=\"95\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"순번\"/><Cell col=\"1\" text=\"상품코드\"/><Cell col=\"2\" text=\"상품명\"/><Cell col=\"3\" text=\"가격적용 시작일\"/><Cell col=\"4\" text=\"가격적용 완료일\"/><Cell col=\"5\" text=\"본수\"/><Cell col=\"6\" text=\"렌탈기간\"/><Cell col=\"7\" text=\"렌탈등록비\"/><Cell col=\"8\" text=\"월렌탈료\"/></Band><Band id=\"body\"><Cell text=\"bind:seq\"/><Cell col=\"1\" text=\"bind:matCd\"/><Cell col=\"2\" text=\"bind:matNm\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:strDay\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:endDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" displaytype=\"combo\" text=\"bind:cntCd\" combodataset=\"ds_cnt\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" displaytype=\"combo\" text=\"bind:periodCd\" combodataset=\"ds_period\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right;\" text=\"bind:regiAmt\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right;\" text=\"bind:rentAmt\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "978", "75", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchPeriod", "absolute", "677", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("렌탈기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_searchPeriod", "absolute", "782", "12", "108", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_period");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("ed_frCd", "absolute", "276", "-10", "81", "21", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_modelCd", "absolute", "80", "-10", "84", "21", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_contentsCd", "absolute", "172", "-10", "104", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchModelTxt", "absolute", "252", "12", "152", "21", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchBrandTxt", "absolute", "115", "12", "137", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCnt", "absolute", "677", "38", "80", "21", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_text("타이어본수");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchOrdDay", "absolute", "424", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("가격적용일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_carOwner", "absolute", "20", "12", "75", "21", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_searchOrdDay", "absolute", "524", "12", "128", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("8");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj = new Combo("cb_searchCnt", "absolute", "782", "38", "108", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_cnt");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static07", "absolute", "0", "0", "974", "12", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "32", "974", "6", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_text("FIX h6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "95", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "404", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "504", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "652", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "762", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "955", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "59", "974", "12", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_seasonCd", "absolute", "115", "38", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_seasonCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_searchOrdDay00", "absolute", "20", "38", "75", "21", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_text("계절구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_seach", "absolute", "910", "12", "45", "22", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("검색");
            obj.getSetter("domainId").set("nexa.add");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "890", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchPettern", "absolute", "226", "38", "43", "21", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("패턴");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_petternCd", "absolute", "289", "38", "115", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_petternCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static11", "absolute", "206", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchSpec", "absolute", "424", "38", "80", "21", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("규격");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "269", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_specCd", "absolute", "524", "38", "128", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_specCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Button("btn_choice", "absolute", "903", "560", "41", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "948", "560", "41", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 978, 75, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 998, 590, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMProductAndPrice_pop");
            		p.set_titletext("상품 및 가격조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMProductAndPrice_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMProductAndPrice_pop.xfdl", function() {
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.args = "";
        this.searchFlag = "false";
        this.searchFlag2 = "false";
        this.selectSaleCd	= 0;
        this.s_saleId = "";
        this.agencySeasonCd = 0;
        this.useAgencyCntCheck = 0;
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //01 : 영업관리자
        //02 : 콜센터
        //03 : 지사
        //04 : 지점
        //05 : 대리점
        this.userGrp = application.gds_userInfo.getColumn(0,"userGrp");
        this.agentId = application.gds_userInfo.getColumn(0,"agentId");

        /*
         * 팝업화면 로드 시 처리
         */
        this.RTCOMMProductAndPrice_pop_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.selectRtsd0108SaleCdCount();
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if (strSvcId=="initProductPriceCombo") {
        		var modelCd 	= nvl(this.parent.p_modelCd);
        		var contentsCd 	= nvl(this.parent.p_contentsCd);

        		var sSvcID        	= "initCombosetMat";                    
        		var sController   	= "rtms/comm/combosetMat.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_combosetMat=mapCombosetMat";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("modelCd"   , modelCd);
        		sArgs += Ex.util.setParam("contentsCd", contentsCd);
        				
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	if( strSvcId=="initCombosetMat" ){
        		var seasonCdCnt = this.ds_seasonCd.getRowCount();
        		if( seasonCdCnt != 0 ){
        			// 계절구분 조회조건에 '전체'추가
        			var insert = this.ds_seasonCd.insertRow( 0 );
        			this.ds_seasonCd.setColumn(insert,"cd"," ");
        			this.ds_seasonCd.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_seasonCd.set_value( " " );
        			
        			if( this.userGrp == "05"){
        				var sSvcID        	= "initProductPriceGetSeason";                    
        				var sController   	= "rtms/comm/initProductPriceGetSeason.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				sArgs += Ex.util.setParam("agentId", this.agentId);
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			}else{
        				this.FN_init2();
        			}
        		}
        	}
        	
        	if( strSvcId == "initProductPriceGetSeason" ){
        		var sSvcID        	= "sRtcs0202UseCntCheck";                    
        		var sController   	= "rtms/comm/sRtcs0202UseCntCheck.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("agentId", this.agentId);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
        	}
        	
        	if( strSvcId=="sRtcs0202UseCntCheck" ){
        		this.FN_init2();
        	}
        	
        	if( strSvcId == "listProductPop" ){
        		this.grid_product.selectRow( -1 );//초기화 해줘야함
        		this.ds_price.deleteAll();
        		
        		var cnt = this.ds_product.getRowCount();
        		if( cnt != 0 ){
        			if( this.parent.p_periodCd != "" && this.parent.p_cntCd != "" && this.parent.p_matNm != "" ){
        				this.searchFlag = "false";
        				this.searchFlag2 = "true";
        				this.grid_product.selectRow( this.ds_product.findRowAs( "matNm", this.parent.p_matNm ) );
        				this.grid_product_oncellclick();
        			}else{
        				this.searchFlag = "true";
        				this.searchFlag2 = "false";
        				this.grid_product.selectRow( -1 );
        			}
        		}else{
        			alert("해당 상품정보가 없습니다.");
        			this.close();
        		}
        	}
        	
        	if( strSvcId == "listProductAndprice" ){
        		var ct = this.ds_price.getRowCount();
        		if( ct != 0 ){
        			if( this.parent.p_periodCd != "" && this.parent.p_cntCd != "" && this.parent.p_matNm != "" && this.parent.p_regiAmt != "" && this.parent.p_rentAmt != "" ){
        				var str = ""
        				str += "periodCd == '"   + this.parent.p_periodCd + "'";
        				str += "&& cntCd == '"   + this.parent.p_cntCd    + "'";
        				str += "&& matNm == '"   + this.parent.p_matNm    + "'";
        				str += "&& regiAmt == '" + this.parent.p_regiAmt  + "'";
        				str += "&& rentAmt == '" + this.parent.p_rentAmt  + "'";
        				this.grid_price.selectRow( this.ds_price.findRowExpr( str,-1 ) );
        			}else{
        				this.grid_price.selectRow( -1 );
        			}
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_postCode.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "selectRtsd0108SaleCdCount" ){
        		if( nvl(this.selectSaleCd) != 0 ){
        			this.s_saleId="02";
        		}else{
        			this.s_saleId="01";
        		}
        	}
        }

        /*
         * 공통코드성 조회조건용 콤보 조회
         */
        this.fn_init = function(){
        	var sSvcID      	= "initProductPriceCombo";  
        	var sController   	= "rtms/comm/initProductPriceCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= " ";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sOutDatasets += " ds_period=mapPeriod ";
        	sOutDatasets += " ds_cnt=mapCnt ";
        	sOutDatasets += " ds_seasonCd=mapSeasonCd ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /*
         * 모화면에서 넘어온 차종, 사양정보 세팅 및 상품조회
         */
        this.FN_init2 = function(){
        	this.div_search.cb_searchPeriod.set_index(-1);
        	this.div_search.cb_searchCnt.set_index(-1);
        	
        	this.div_search.ed_searchBrandTxt.set_value(this.parent.p_makerTxt);
        	this.div_search.ed_searchModelTxt.set_value(this.parent.p_modelTxt);
        	
        	this.div_search.ed_modelCd.set_value(this.parent.p_modelCd);
        	this.div_search.ed_contentsCd.set_value(this.parent.p_contentsCd);
        	this.div_search.ed_frCd.set_value(this.parent.p_frCd);
        	this.div_search.cal_searchOrdDay.set_value(this.parent.p_ordDay);

        	if( this.parent.p_periodCd != "" ){
        		this.div_search.cb_searchPeriod.set_value(this.parent.p_periodCd);
        	}
        	if( this.parent.p_cntCd != "" ){
        		this.div_search.cb_searchCnt.set_value(this.parent.p_cntCd);
        	}
        	if( this.parent.p_seasonCd != "" ){
        		this.div_search.cb_seasonCd.set_value(this.parent.p_seasonCd);
        	}else{
        		// 대리점 정보의 계절구분이 '4계절'인 경우 계절구분을 '4계절'로 고정
        		if( this.agencySeasonCd == "01" ){
        			this.div_search.cb_seasonCd.set_value("01");
        			this.div_search.cb_seasonCd.set_enable(false);
        			// 패턴, 규격 drill-down 처리
        			this.FN_postSeasonCdSelect("01");
        		}else{
        			this.div_search.cb_seasonCd.set_enable(true);
        		}
        	}

        	//this.FN_listProduct("1");												// 박정석 대리 요청으로 최초 자동조회 기능 삭제
        }

        this.FN_listProduct = function(mode) {
        	var modelCd 	= nvl(this.div_search.ed_modelCd.value);				// 모델
        	var contentsCd 	= nvl(this.div_search.ed_contentsCd.value);				// 사양
        	var frCd 		= nvl(this.div_search.ed_frCd.value);					// 전후구분
        	var seasonCd 	= nvl(this.div_search.cb_seasonCd.value);				// 계절구분	
        	var petternCd   = nvl(this.div_search.cb_petternCd.value);				// 패턴
        	var specCd      = nvl(this.div_search.cb_specCd.value);					// 규격
        	var cnt 		= nvl(this.div_search.cb_searchCnt.value);				// 타이어본수	
        	
        	// 규격관련 조회조건 세팅
        	// - 단면폭, 편평비, 인치, PR
        //  	var expr = "";
        //  	expr += "seasonCd=='"    + seasonCd  + "'";
        //  	expr += "&&petternCd=='" + petternCd + "'";
        //  	expr += "&&specNm=='"    + specCd    + "'";
        //  
        //  	var nRow = this.ds_combosetMat.findRowExpr(expr);
        	
        //2018.05.30 김선태 
        //N'FERA AU7 패턴코드 인식오류로 인해 for문으로 직접 조회
         	var val01= "";
         	var val02 = "";
         	var val03 = "";
         	for(var i=0; i<=this.ds_combosetMat.rowcount; i++){
         		val01 = this.ds_combosetMat.getColumn(i, "seasonCd");
         		val02 = this.ds_combosetMat.getColumn(i, "petternCd");
         		val03 = this.ds_combosetMat.getColumn(i, "specNm");
         
         		if(val01 == seasonCd && val02 == petternCd && val03 == specCd){
         			nRow = i;
         			break;
         		}		
         	}
        	
        	var sectionWidth = this.ds_combosetMat.getColumn(nRow, "sectionWidth");	// 단면폭
        	var aspectRatio  = this.ds_combosetMat.getColumn(nRow, "aspectRatio");	// 편평비
        	var wheelInches  = this.ds_combosetMat.getColumn(nRow, "wheelInches");	// 인치
        	var plyRating    = this.ds_combosetMat.getColumn(nRow, "plyRating");	// PR
        	
        	/*
        	 * mode = 1 : 최초 자동조회. 조회조건 제한 없음
        	 * mode = 2 : 기타. 일반적인 조회. 조회조건 제한 있음
        	 */
        	if (mode != "1") {	
        		if( modelCd == "" ){
        			alert("모델 값이 없습니다.");
        			return false;
        		}else if( contentsCd == "" ){
        			alert("사양 값이 없습니다.");
        			return false;
        		}else if( frCd == "" ){
        			alert("전후 구분 값이 없습니다.");
        			return false;
        		}else if( cnt == "" ){
        			alert("타이어본수 구분 값이 없습니다.");
        			this.div_search.cb_searchCnt.setFocus();
        			return false;
        		}
        	}
        	
        	var sSvcID        	= "listProductPop";                    
        	var sController   	= "rtms/comm/listProductPop.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_product=mapProduct";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("modelCd"     , modelCd);
        	sArgs += Ex.util.setParam("contentsCd"  , contentsCd);
        	sArgs += Ex.util.setParam("frCd"        , frCd);
        	sArgs += Ex.util.setParam("seasonCd"    , seasonCd);
        	sArgs += Ex.util.setParam("petternCd"   , petternCd);
        	sArgs += Ex.util.setParam("sectionWidth", sectionWidth);
        	sArgs += Ex.util.setParam("aspectRatio" , aspectRatio);
        	sArgs += Ex.util.setParam("wheelInches" , wheelInches);
        	sArgs += Ex.util.setParam("plyRating"   , plyRating);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.selectRtsd0108SaleCdCount = function(){
        	var carNo = nvl(this.parent.p_carNo);
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

        /*
         *  계절구분 조회조건 변경 시 이벤트 처리
         */
        this.div_search_cb_seasonCd_onitemchanged = function(obj,e) {	
        	this.FN_postSeasonCdSelect(e.postvalue);
        }

        /*
         * 계절구분 조회조건 선택 이후 처리
         * - 대리점의 경우 계절구분이 '4계절'로 자동고정되는 경우가 있어 분리하여 생성
         */
        this.FN_postSeasonCdSelect = function(pSeasonCd) {
        	// 관련 조회조건 dataset 초기화
        	this.ds_petternCd.clearData();				// 패턴
        	this.ds_specCd.clearData();					// 규격
        	
        	// 계절구분에 부합하는 패턴 조회조건 생성
        	this.FN_makePetternCombo(pSeasonCd);
        	
        	// 관련 조회조건 선택값 초기화
        	this.div_search.cb_petternCd.set_index(0);	// 패턴
        	this.div_search.cb_specCd.set_index(0);		// 규격	
        }

        /*
         * 특정 계절구분에 부합하는 패턴 조회조건 콤보 데이터셋 생성
         */
        this.FN_makePetternCombo = function(seasonCd) {

        	for (var idx=0; idx < this.ds_combosetMat.rowcount; idx++) {
        		var srcPetternCd = this.ds_combosetMat.getColumn(idx, "petternCd");
        		var srcPetternNm = this.ds_combosetMat.getColumn(idx, "petternNm");
        		
        		if (
        			(this.ds_combosetMat.getColumn(idx, "seasonCd") == seasonCd) 
        			&& 
        			(this.ds_petternCd.findRow("cd", srcPetternCd) == -1)			// 중복인 경우 제외
        		) {
        			var idxAdd = this.ds_petternCd.addRow();
        			
         			this.ds_petternCd.setColumn(idxAdd, "cd"  , srcPetternCd);
         			this.ds_petternCd.setColumn(idxAdd, "cdNm", srcPetternNm);
        		}
        	}
        	
        	// 전체 추가
        	var insert = this.ds_petternCd.insertRow( 0 );
        	this.ds_petternCd.setColumn(insert,"cd"," ");
        	this.ds_petternCd.setColumn(insert,"cdNm","전체");
        }

        /*
         * 패턴 조회조건 변경 시 이벤트 처리
         */
        this.div_search_cb_petternCd_onitemchanged = function(obj,e) {
        	// 관련 조회조건 dataset 초기화
        	this.ds_specCd.clearData();					// 규격
        	
        	// 계절구분, 패턴에 부합하는 규격 조회조건 생성
        	this.FN_makeSpecCombo(this.div_search.cb_seasonCd.value, e.postvalue);
        	
        	// 관련 조회조건 선택값 초기화
        	this.div_search.cb_specCd.set_index(0);		// 규격
        }

        /*
         * 특정 계절구분, 패턴에 부합하는 규격 조회조건 콤보 데이터셋 생성
         */
        this.FN_makeSpecCombo = function(seasonCd,petternCd) {

        	for (var idx=0; idx < this.ds_combosetMat.rowcount; idx++) {
        		var srcSpecCd = this.ds_combosetMat.getColumn(idx, "specNm");	// 규격은 하나의 컬럼이 아니므로 일단 스펙명으로 코드 세팅
        		var srcSpecNm = this.ds_combosetMat.getColumn(idx, "specNm");
        		
        		if (
        			(this.ds_combosetMat.getColumn(idx, "seasonCd") == seasonCd) 
        			&& 
        			(this.ds_combosetMat.getColumn(idx, "petternCd") == petternCd) 
        			&&
        			(this.ds_specCd.findRow("cd", srcSpecCd) == -1)
        		) {
        			var idxAdd = this.ds_specCd.addRow();
        			
         			this.ds_specCd.setColumn(idxAdd, "cd"  , srcSpecCd);
         			this.ds_specCd.setColumn(idxAdd, "cdNm", srcSpecNm);
        		}
        	}
        	
        	// 전체 추가
        	var insert = this.ds_specCd.insertRow( 0 );
        	this.ds_specCd.setColumn(insert,"cd"," ");
        	this.ds_specCd.setColumn(insert,"cdNm","전체");
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_searchPeriod_onitemchanged = function(obj,e){
        	this.ds_price.clearData();
        	this.div_search.cb_searchCnt.set_index(-1);
        	this.div_search.cb_searchCnt.setFocus(true);
        }

        /*
         * [타이어본수] 조회조건 변경 이벤트 처리
         */
        this.div_search_cb_searchCnt_onitemchanged = function(obj,e){
        	var wheelQty;
        	var rowposition = this.ds_product.rowposition;	
        	
        	if (rowposition == -1) {
        		wheelQty = 4;
        	} else {
        		wheelQty = nvl(this.ds_product.getColumn(rowposition, "wheelQty"));
        	}
        	
        	if( obj.value != "" ){
        		/*
        		if( this.parent.p_saleId == "01" ){ //일반
        			var cntCd = nvl(this.div_search.cb_searchCnt.value);
        			if(cntCd != "02" && cntCd != "04"){
        				alert("선택가능한 타이어본수는 '2본', '4본' 입니다.");
        				this.div_search.cb_searchCnt.set_index(-1);
        				return false;
        			}else{
        				
        			}
        		}
        		*/
        		if( this.s_saleId == "01" ){ //일반
        			var cntCd = nvl(this.div_search.cb_searchCnt.value);
        			if(cntCd != "02" && cntCd != "04"){
        				alert("선택가능한 타이어본수는 '2본', '4본' 입니다.");
        				this.div_search.cb_searchCnt.set_index(-1);
        				this.searchFlag = "true";
        				this.searchFlag2 = "false";
        				this.ds_price.clearData();
        				return false;
        			}else{
        				
        			}
        		}
        		
        		if( wheelQty < parseInt(obj.value)){
        			alert("선택가능한 타이어본수는 \'"+wheelQty+"본\' 이하 입니다.");
        			this.div_search.cb_searchCnt.set_index(-1);
        			this.searchFlag = "true";
        			this.searchFlag2 = "false";
        			this.ds_price.clearData();
        			return false;
        		}
        		
        		if (rowposition != -1) {
        			this.grid_product.selectRow( 0 );
        			this.grid_product_oncellclick();
        		}		
        	}
        }

        /*
         * [검색] 버튼 클릭 이벤트 처리
         */
        this.div_search_btn_seach_onclick = function(obj,e)	{
        	this.FN_listProduct("2");
        }

        /*
         * 상품검색결과 클릭 이벤트 처리
         * - 가격정보조회
         */
        this.grid_product_oncellclick = function(obj,e){
        	var	period 		= nvl(this.div_search.cb_searchPeriod.value);
        	var cnt 		= nvl(this.div_search.cb_searchCnt.value);
        	var ordDay 		= nvl(this.div_search.cal_searchOrdDay.value);
        	
        	var modelCd 	= nvl(this.parent.p_modelCd);
        	var contentsCd 	= nvl(this.parent.p_contentsCd);
        	var frCd 		= nvl(this.parent.p_frCd);
        	
        	var nRow 		= this.ds_product.rowposition;
        	var matCd		= this.ds_product.getColumn( nRow, "matCd");
        	var modelCd 	= this.ds_product.getColumn( nRow, "modelCd");
        	var contentsCd 	= this.ds_product.getColumn( nRow, "contentsCd");
        	var frCd 		= this.ds_product.getColumn( nRow, "frCd");
        	
        	if( this.searchFlag == "false" && this.searchFlag2 == "true"){
        		this.FN_listProductAndprice(period, cnt, ordDay, matCd, modelCd, contentsCd, frCd);
        	}else if( this.searchFlag  == "true" && this.searchFlag2 == "false"){
        		if( matCd != "" && modelCd !="" && contentsCd !="" && frCd !="" ){
        			if( period == "" ){
        				alert( this.div_search.st_searchPeriod.text + " 값이 없습니다." );
        				this.div_search.cb_searchPeriod.setFocus(true);
        			}else if( cnt == "" ){
        				alert( this.div_search.st_searchCnt.text + " 값이 없습니다." );
        				this.div_search.cb_searchCnt.setFocus(true);
        			}else if( ordDay == "" ){
        				alert( this.div_search.st_searchOrdDay.text + " 값이 없습니다." );
        				this.div_search.cal_searchOrdDay.setFocus(true);
        			}else{
        				this.FN_listProductAndprice(period, cnt, ordDay, matCd, modelCd, contentsCd, frCd);
        			}
        		}
        	}else{
        	}
        }

        /*
         * 가격정보 조회
         */
        this.FN_listProductAndprice = function(period,cnt,ordDay,matCd,modelCd,contentsCd,frCd){
        	
        	var sSvcID        	= "listProductAndprice";                    
        	var sController   	= "rtms/comm/listProductAndprice.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_price=mapProductAndprice";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_price.deleteAll();
        	
        	sArgs += Ex.util.setParam("period", period);
        	sArgs += Ex.util.setParam("cnt", cnt);
        	sArgs += Ex.util.setParam("ordDay", ordDay);
        	sArgs += Ex.util.setParam("matCd", matCd);
        	sArgs += Ex.util.setParam("modelCd", modelCd);
        	sArgs += Ex.util.setParam("contentsCd", contentsCd);
        	sArgs += Ex.util.setParam("frCd", frCd);
        	sArgs += Ex.util.setParam("priceCd", "0002");
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /*
         * 가격정보 조회결과 더블클릭 이벤트 처리
         * - [선택] 버튼 클릭과 동일한 효과
         */
        this.grid_price_oncelldblclick = function(obj,e){
        	this.FN_childReturn();
        }

        /*
         * [선택] 버튼 클릭 이벤트 처리
         */
        this.btn_choice_onclick = function(obj,e){
        	this.FN_childReturn();
        }

        /*
         * 가격 최종 선택 처리
         * - 선택된 상품&가격정보를 본 팝업화면을 호출한 모화면으로 반환
         * - 본 팝업화면은 닫기
         */
        this.FN_childReturn = function(){
        	var pos = this.ds_price.rowposition;
        	var posGrid = this.grid_price.currentrow;
        	var seasonCd = this.ds_price.getColumn(pos,"seasonCd");
        	
        	if( posGrid == -1 ){
        		alert("선택된 데이터가 없습니다.");
        		return false;
        	}else{
        		/*
        		if( (this.userGrp == "05") && (seasonCd == "02") && (this.useAgencyCntCheck == 0) ){
        			alert("보관할 창고가 없으므로 겨울용 타이어는 등록할 수가 없습니다.");
        			return false;
        		}
        		*/
        		
        		if( this.parent.p_arg == "RTSDContractRegister" ){
        			this.ds_priceCp.clearData();
        			var idx = this.ds_priceCp.addRow();
        			this.ds_priceCp.copyRow(idx, this.ds_price, pos);
        			
        			// 조회조건과 선택 상품 및 가격이 다른 경우 확인
        			var condSeason  = nvl(this.div_search.cb_seasonCd.text);
        			var condPettern = nvl(this.div_search.cb_petternCd.text);
        			var condSpec    = nvl(this.div_search.cb_specCd.text);
        			
        			var selSeason   = this.ds_priceCp.getColumn(0, "seasonNm");
        			var selPettern  = this.ds_priceCp.getColumn(0, "petternCd");
        			
        			var selSpec     = "";
        			selSpec += this.ds_priceCp.getColumn(0, "sectionWidth");
        			selSpec += "/" + this.ds_priceCp.getColumn(0, "aspectRatio");
        			selSpec += "R" + this.ds_priceCp.getColumn(0, "wheelInches");
        			selSpec += " " + this.ds_priceCp.getColumn(0, "plyRating") + "P";
        			
         			if (condSeason != "전체" && condSeason != "" && condSeason != selSeason) {
        				if (!this.confirm("조회조건의 계절구분(" + condSeason + ")과 선택한 계절구분(" + selSeason + ")이 다릅니다.\n계속 진행하시겠습니까?")) {					
        					return false;
        				}
         			}
         			
         			if (condPettern != "전체" && condPettern != "" && condPettern != selPettern) {
        				if (!this.confirm("조회조건의 패턴(" + condPettern + ")과 선택한 패턴(" + selPettern + ")이 다릅니다.\n계속 진행하시겠습니까?")) {					
        					return false;
        				}
         			}
         			
         			if (condSpec != "전체" && condSpec != "" && condSpec != selSpec) {
        				if (!this.confirm("조회조건의 규격(" + condSpec + ")과 선택한 규격(" + selSpec + ")이 다릅니다.\n계속 진행하시겠습니까?")) {					
        					return false;
        				}
         			}
        			
        			// 선택 상품 및 가격 확인
        			var matNm    = this.ds_priceCp.getColumn(0, "matNm");		// 상품명
        			var ordQty   = this.ds_priceCp.getColumn(0, "ordQty");		// 타이어본수
        			var preiodCd = this.ds_priceCp.getColumn(0, "periodCd");	// 렌탈개월수
        			
        			if (this.confirm("선택하신 상품은 " + matNm + " " + ordQty + "본 " + preiodCd + "개월입니다")) {
        				var arr = [this.ds_priceCp, nvl(this.div_search.cal_searchOrdDay.value)];
        				this.close(this.opener.returnProPriInfo(arr));
        			} else {
        				return false;
        			}
        		}
        	}
        }

        /*
         * [닫기] 버튼 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e){  
        	this.close();
        }

        /*
         * Esc 키 입력 시 팝업 닫기
         */
        this.RTCOMMProductAndPrice_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMProductAndPrice_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMProductAndPrice_pop_onkeyup, this);
            this.grid_product.addEventHandler("oncellclick", this.grid_product_oncellclick, this);
            this.grid_price.addEventHandler("oncelldblclick", this.grid_price_oncelldblclick, this);
            this.div_search.cb_searchPeriod.addEventHandler("onitemchanged", this.div_search_cb_searchPeriod_onitemchanged, this);
            this.div_search.cb_searchCnt.addEventHandler("onitemchanged", this.div_search_cb_searchCnt_onitemchanged, this);
            this.div_search.cb_seasonCd.addEventHandler("onitemchanged", this.div_search_cb_seasonCd_onitemchanged, this);
            this.div_search.btn_seach.addEventHandler("onclick", this.div_search_btn_seach_onclick, this);
            this.div_search.cb_petternCd.addEventHandler("onitemchanged", this.div_search_cb_petternCd_onitemchanged, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMProductAndPrice_pop.xfdl");

       
    };
}
)();
