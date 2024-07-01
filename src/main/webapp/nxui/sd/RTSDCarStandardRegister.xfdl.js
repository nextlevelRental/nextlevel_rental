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
                this.set_name("RTSDCarStandardRegister");
                this.set_classname("RTSDCarStandard");
                this.set_titletext("차종규격등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_modelCdS", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contentsCdS", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_frCdS", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_plyRatingS", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_sectionWidthS", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_aspectRatioS", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelInchesS", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYnS", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_modelCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contentsCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_frCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_plyRating", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_sectionWidth", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_aspectRatio", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelInches", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelQty", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelLimitQty", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_classCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_modelCdGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contentsCdGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_frCdGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_plyRatingGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelInchesGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_aspectRatioGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_sectionWidthGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelQtyGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelLimitQtyGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_classCdGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYnGrid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0004", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"wheelQty\" type=\"STRING\" size=\"256\"/><Column id=\"wheelLimitQty\" type=\"STRING\" size=\"256\"/><Column id=\"classCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static02", "absolute", "800", "108", "347", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "800", "0", "20", "496", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_carMasterSelect", "absolute", "0", "117", "800", "379", null, null, this);
            obj.set_taborder("5");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("none");
            obj.set_binddataset("ds_rtsd0004");
            obj.set_scrollbars("autoboth");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"160\"/><Column size=\"160\"/><Column size=\"80\"/><Column size=\"160\"/><Column size=\"160\"/><Column size=\"160\"/><Column size=\"160\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"160\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"차종\"/><Cell col=\"1\" text=\"사양\"/><Cell col=\"2\" text=\"전후 구분\"/><Cell col=\"3\" text=\"단면폭\"/><Cell col=\"4\" text=\"편평비\"/><Cell col=\"5\" text=\"인치\"/><Cell col=\"6\" text=\"PR(강도)\"/><Cell col=\"7\" text=\"바퀴수\"/><Cell col=\"8\" text=\"장착가능 바퀴수\"/><Cell col=\"9\" text=\"차량분류\"/><Cell col=\"10\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"combo\" edittype=\"none\" text=\"bind:modelCd\" combodataset=\"ds_modelCdGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"none\" text=\"bind:contentsCd\" combodataset=\"ds_contentsCdGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"2\" displaytype=\"combo\" edittype=\"none\" text=\"bind:frCd\" combodataset=\"ds_frCdGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"none\" text=\"bind:sectionWidth\" mask=\"###,###,###,##0\" combodataset=\"ds_sectionWidthGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"none\" text=\"bind:aspectRatio\" mask=\"###,###,###,##0\" combodataset=\"ds_aspectRatioGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"5\" displaytype=\"combo\" edittype=\"none\" text=\"bind:wheelInches\" mask=\"###,###,###,##0\" combodataset=\"ds_wheelInchesGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"6\" displaytype=\"combo\" edittype=\"none\" text=\"bind:plyRating\" combodataset=\"ds_plyRatingGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"7\" displaytype=\"combo\" edittype=\"none\" text=\"bind:wheelQty\" mask=\"###,###,###,##0\" combodataset=\"ds_wheelQtyGrid\" combocodecol=\"cdNm\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"8\" displaytype=\"combo\" edittype=\"none\" text=\"bind:wheelLimitQty\" mask=\"###,###,###,##0\" combodataset=\"ds_wheelLimitQtyGrid\" combocodecol=\"cdNm\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"9\" displaytype=\"combo\" edittype=\"none\" text=\"bind:classCd\" combodataset=\"ds_classCdGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"10\" displaytype=\"combo\" edittype=\"none\" text=\"bind:useYn\" combodataset=\"ds_useYnGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "92", "169", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("차종규격리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "107", "1147", "10", null, null, this);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "76", "25", null, this);
            obj.set_taborder("10");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "25", "13", "80", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_modelCdS", "absolute", "105", "12", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_modelCdS");
            obj.set_index("-1");
            obj = new Static("Static01", "absolute", "273", "13", "80", "21", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("사양");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_contentsCdS", "absolute", "353", "12", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_contentsCdS");
            obj.set_index("0");
            obj = new Static("Static02", "absolute", "521", "13", "80", "21", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_text("전후_구분");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_frCdS", "absolute", "601", "12", "180", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_frCdS");
            obj.set_index("-1");
            obj = new Static("Static24", "absolute", "248", "0", "25", "72", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "496", "0", "25", "72", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "781", "0", "25", "72", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "806", "13", "80", "21", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_text("PR(강도)");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_plyRatingS", "absolute", "886", "12", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_plyRatingS");
            obj.set_index("-1");
            obj = new Static("Static29", "absolute", "0", "33", "1118", "6", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "25", "39", "80", "21", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("단면폭");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_sectionWidthS", "absolute", "105", "39", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("5");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_sectionWidthS");
            obj.set_index("0");
            obj = new Static("Static07", "absolute", "273", "39", "80", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("편평비");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_aspectRatioS", "absolute", "353", "39", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_aspectRatioS");
            obj.set_index("0");
            obj = new Static("Static08", "absolute", "521", "39", "80", "21", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("인치");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_wheelInchesS", "absolute", "601", "39", "180", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_wheelInchesS");
            obj.set_index("0");
            obj = new Static("Static09", "absolute", "806", "39", "80", "21", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_useYnS", "absolute", "886", "39", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("8");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_useYnS");
            obj.set_index("-1");
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "60", null, "12", "0", null, this.div_search);
            obj.set_taborder("21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "0", "25", "72", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "820", "150", "302", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "820", "180", "302", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "820", "210", "302", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "820", "270", "302", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "820", "300", "302", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "820", "330", "302", "31", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "820", "240", "302", "31", null, null, this);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "820", "358", "302", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "820", "388", "302", "31", null, null, this);
            obj.set_taborder("30");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "820", "418", "302", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "820", "448", "302", "31", null, null, this);
            obj.set_taborder("32");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_modelCd", "absolute", "945", "155", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("11");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_modelCd");

            obj = new Static("st_modelCd", "absolute", "820", "150", "120", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_contentsCd", "absolute", "945", "184", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("12");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_contentsCd");

            obj = new Static("st_contentsCd", "absolute", "820", "180", "120", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_text("사양");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_frCd", "absolute", "945", "216", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_frCd");

            obj = new Static("st_frCd", "absolute", "820", "210", "120", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("전후_구분");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_sectionWidth", "absolute", "945", "275", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("15");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_sectionWidth");

            obj = new Static("st_sectionWidth", "absolute", "820", "270", "120", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("단면폭");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_aspectRatio", "absolute", "945", "305", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("16");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_aspectRatio");

            obj = new Static("st_aspectRatio", "absolute", "820", "300", "120", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_text("편평비");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_wheelInches", "absolute", "820", "330", "120", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("인치");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_wheelInches", "absolute", "945", "334", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("17");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_wheelInches");

            obj = new Static("st_plyRating", "absolute", "820", "240", "120", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_text("PR(강도)");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_plyRating", "absolute", "945", "244", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("14");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_plyRating");

            obj = new Static("st_wheelQty", "absolute", "820", "358", "120", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("바퀴수");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_wheelQty", "absolute", "945", "364", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("18");
            obj.set_codecolumn("cdNm");
            obj.set_datacolumn("cdNm");
            obj.set_enable("true");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_wheelQty");
            obj.set_index("-1");

            obj = new Static("st_wheelLimitQty", "absolute", "820", "388", "120", "31", null, null, this);
            obj.set_taborder("41");
            obj.set_text("장착가능 바퀴수");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_wheelLimitQty", "absolute", "945", "393", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("19");
            obj.set_codecolumn("cdNm");
            obj.set_datacolumn("cdNm");
            obj.set_enable("true");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_wheelLimitQty");
            obj.set_index("-1");

            obj = new Static("st_classCd", "absolute", "820", "418", "120", "31", null, null, this);
            obj.set_taborder("42");
            obj.set_text("차량분류");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_classCd", "absolute", "945", "423", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("20");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("true");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_classCd");

            obj = new Static("st_useYn", "absolute", "820", "448", "120", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_useYn", "absolute", "945", "453", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("21");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("true");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_useYn");

            obj = new Button("btn_del", "absolute", "1077", "118", "45", "22", null, null, this);
            obj.set_taborder("45");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_new", "absolute", "1027", "118", "45", "22", null, null, this);
            obj.set_taborder("46");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "76", "1147", "20", null, null, this);
            obj.set_taborder("47");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "800", "140", "347", "10", null, null, this);
            obj.set_taborder("48");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 76, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("10");
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
            		p.set_classname("RTSDCarStandard");
            		p.set_titletext("차종규격등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","cb_modelCd","value","ds_rtsd0004","modelCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","cb_contentsCd","value","ds_rtsd0004","contentsCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","cb_frCd","value","ds_rtsd0004","frCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cb_plyRating","value","ds_rtsd0004","plyRating");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","cb_sectionWidth","value","ds_rtsd0004","sectionWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","cb_aspectRatio","value","ds_rtsd0004","aspectRatio");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","cb_wheelInches","value","ds_rtsd0004","wheelInches");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","cb_wheelQty","value","ds_rtsd0004","wheelQty");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","cb_wheelLimitQty","value","ds_rtsd0004","wheelLimitQty");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","cb_classCd","value","ds_rtsd0004","classCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","cb_useYn","value","ds_rtsd0004","useYn");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDCarStandardRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCarStandardRegister.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTSDCarStandardRegister" ){
        		var modelCdCt = this.ds_modelCdS.getRowCount();
        		var useYnCt = this.ds_useYnS.getRowCount();
        		
        		if( modelCdCt != 0 ){
        			this.div_search.cb_modelCdS.set_value( this.ds_modelCdS.getColumn(this.ds_modelCdS.rowposition, "cd") );
        			this.div_search_cb_modelCdS_onitemchanged();
        			this.div_search_cb_contentsCdS_onitemchanged();
        			this.div_search_cb_frCdS_onitemchanged();
        			this.div_search_cb_plyRatingS_onitemchanged();
        			this.div_search_cb_sectionWidthS_onitemchanged();
        			this.div_search_cb_aspectRatioS_onitemchanged();
        		}
        		
        		if( useYnCt != 0 ){
        			var insert = this.ds_useYnS.insertRow( 0 );
        			this.ds_useYnS.setColumn(insert,"cd"," ");
        			this.ds_useYnS.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_useYnS.set_value( " " );
        			
        			this.div_search.cb_useYnS.set_value( this.ds_useYnS.getColumn(this.ds_useYnS.rowposition, "cd")  );
        		}
        	}
        	
        	if( strSvcId == "saveRTSDCarStandardRegister" ){
        		alert(strErrorMsg);
        		if( nErrorCode == "0" ){
        			this.reload();
        		}
        	}
        	
        	if( strSvcId == "sRtsd0004ContentsCdSelect" ){
        		var insert = this.ds_contentsCdS.insertRow( 0 );
        		this.ds_contentsCdS.setColumn(insert,"cd"," ");
        		this.ds_contentsCdS.setColumn(insert,"cdNm","전체");
        		this.div_search.cb_useYnS.set_value( " " );

        		this.div_search.cb_contentsCdS.set_value( this.ds_contentsCdS.getColumn(this.ds_contentsCdS.rowposition, "cd")  );
        	}

        	if( strSvcId == "sRtsd0004FrCdSelect" ){
        		var insert = this.ds_frCdS.insertRow( 0 );
        		this.ds_frCdS.setColumn(insert,"cd"," ");
        		this.ds_frCdS.setColumn(insert,"cdNm","전체");
        		this.div_search.cb_useYnS.set_value( " " );

        		this.div_search.cb_frCdS.set_value( this.ds_frCdS.getColumn(this.ds_frCdS.rowposition, "cd")  );
        	}

        	if( strSvcId == "sRtsd0004PlyRatingCdSelect" ){
        		var insert = this.ds_plyRatingS.insertRow( 0 );
        		this.ds_plyRatingS.setColumn(insert,"cd"," ");
        		this.ds_plyRatingS.setColumn(insert,"cdNm","전체");
        		this.div_search.cb_useYnS.set_value( " " );

        		this.div_search.cb_plyRatingS.set_value( this.ds_plyRatingS.getColumn(this.ds_plyRatingS.rowposition, "cd")  );
        	}

        	if( strSvcId == "sRtsd0004SectionWidthSelect" ){
        		var insert = this.ds_sectionWidthS.insertRow( 0 );
        		this.ds_sectionWidthS.setColumn(insert,"cd"," ");
        		this.ds_sectionWidthS.setColumn(insert,"cdNm","전체");
        		this.div_search.cb_useYnS.set_value( " " );

        		this.div_search.cb_sectionWidthS.set_value( this.ds_sectionWidthS.getColumn(this.ds_sectionWidthS.rowposition, "cd")  );
        	}

        	if( strSvcId == "sRtsd0004AspectRatioSelect" ){
        		var insert = this.ds_aspectRatioS.insertRow( 0 );
        		this.ds_aspectRatioS.setColumn(insert,"cd"," ");
        		this.ds_aspectRatioS.setColumn(insert,"cdNm","전체");
        		this.div_search.cb_useYnS.set_value( " " );

        		this.div_search.cb_aspectRatioS.set_value( this.ds_aspectRatioS.getColumn(this.ds_aspectRatioS.rowposition, "cd")  );
        	}

        	if( strSvcId == "sRtsd0004WheelInchesSelect" ){
        		var insert = this.ds_wheelInchesS.insertRow( 0 );
        		this.ds_wheelInchesS.setColumn(insert,"cd"," ");
        		this.ds_wheelInchesS.setColumn(insert,"cdNm","전체");
        		this.div_search.cb_useYnS.set_value( " " );

        		this.div_search.cb_wheelInchesS.set_value( this.ds_wheelInchesS.getColumn(this.ds_wheelInchesS.rowposition, "cd")  );
        	}
        	
        	if( strSvcId == "sRtsd0004Select" ){
        		var rowCt = this.ds_rtsd0004();
        		if( rowCt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.grid_carMasterSelect.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDCarStandardRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("E|C|S", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "initRTSDCarStandardRegister";  
        	var sController   	= "rtms/sd/initRTSDCarStandardRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sOutDatasets += " ds_modelCdS=mapDsModelCdS ";					//1.차종
        	sOutDatasets += " ds_useYnS=mapDsUseYnS ";						//11.사용여부    
        		 
        	sOutDatasets += " ds_modelCd=mapDsModelCd ";					//1.차종
        	sOutDatasets += " ds_contentsCd=mapDsContentsCd ";				//2.사양 
        	sOutDatasets += " ds_frCd=mapDsFrCd ";							//3.전후구분 	
        	sOutDatasets += " ds_plyRating=mapDsPlyRating ";				//4.PR(강도) 
        	sOutDatasets += " ds_sectionWidth=mapDsSectionWidth ";			//5.단면폭
        	sOutDatasets += " ds_aspectRatio=mapDsAspectRatio ";			//6.편평비 
        	sOutDatasets += " ds_wheelInches=mapDsWheelInches ";			//7.인치
        	sOutDatasets += " ds_wheelQty=mapDsWheelQty ";					//8.바퀴수
        	sOutDatasets += " ds_wheelLimitQty=mapDsWheelLimitQty ";		//9.장착가능 바퀴수
        	sOutDatasets += " ds_classCd=mapDsClassCd ";					//10.차량분류 
        	sOutDatasets += " ds_useYn=mapDsUseYn ";						//11.사용여부
        	
        	sOutDatasets += " ds_modelCdGrid=mapDsModelCdGrid ";			//1.차종
        	sOutDatasets += " ds_contentsCdGrid=mapDsContentsCdGrid ";		//2.사양 
        	sOutDatasets += " ds_frCdGrid=mapDsFrCdGrid ";					//3.전후구분 	
        	sOutDatasets += " ds_plyRatingGrid=mapDsPlyRatingGrid ";		//4.PR(강도) 
        	sOutDatasets += " ds_sectionWidthGrid=mapDsSectionWidthGrid ";	//5.단면폭
        	sOutDatasets += " ds_aspectRatioGrid=mapDsAspectRatioGrid ";	//6.편평비 
        	sOutDatasets += " ds_wheelInchesGrid=mapDsWheelInchesGrid ";	//7.인치
        	sOutDatasets += " ds_wheelQtyGrid=mapDsWheelQtyGrid ";			//8.바퀴수
        	sOutDatasets += " ds_wheelLimitQtyGrid=mapDsWheelLimitQtyGrid ";//9.장착가능 바퀴수
        	sOutDatasets += " ds_classCdGrid=mapDsClassCdGrid ";			//10.차량분류 
        	sOutDatasets += " ds_useYnGrid=mapDsUseYnGrid ";				//11.사용여부
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	var msg	 	 = "은(는) 필수항목 입니다.";
        	var rowCount = this.ds_rtsd0004.getRowCount();
        	var goSaveFlag = true;
        	
        	if( rowCount != 0){
        		var saveFlag = false;
        		for( var i = 0 ; i < rowCount ; i++){
        			var rowType 	= this.ds_rtsd0004.getRowType(i);
        			if(rowType == 2 || rowType == 4){
        				saveFlag= true;break;
        			}else{
        				saveFlag= false;
        			}
        		}
        		
        		if( saveFlag == false ){
        			alert("수정된 사항이 없습니다.");
        			return false;
        		}else{
        			for( var i = 0 ; i < rowCount ; i++){
        				var modelCd 		= nvl(this.ds_rtsd0004.getColumn(i, "modelCd"));
        				var contentsCd 		= nvl(this.ds_rtsd0004.getColumn(i, "contentsCd"));
        				var frCd 			= nvl(this.ds_rtsd0004.getColumn(i, "frCd"));
        				var sectionWidth 	= nvl(this.ds_rtsd0004.getColumn(i, "sectionWidth"));
        				var aspectRatio 	= nvl(this.ds_rtsd0004.getColumn(i, "aspectRatio"));
        				var wheelInches 	= nvl(this.ds_rtsd0004.getColumn(i, "wheelInches"));
        				var plyRating 		= nvl(this.ds_rtsd0004.getColumn(i, "plyRating"));
        				
        				var wheelQty 		= nvl(this.ds_rtsd0004.getColumn(i, "wheelQty"));
        				var wheelLimitQty 	= nvl(this.ds_rtsd0004.getColumn(i, "wheelLimitQty"));
        				var classCd 		= nvl(this.ds_rtsd0004.getColumn(i, "classCd"));
        				
        				if( modelCd == "" ){			alert("차종" + msg);				this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        				else if( contentsCd == "" ){	alert("사양" + msg); 				this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        				else if( frCd == "" ){			alert("전후 구분" + msg); 			this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        				else if( sectionWidth == "" ){	alert("단면폭" + msg); 			this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        				else if( aspectRatio == "" ){	alert("편평비" + msg); 			this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        				else if( wheelInches == "" ){	alert("인치" + msg); 				this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        				else if( plyRating == "" ){		alert("PR(강도)" + msg); 			this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        				else if( wheelQty == "" ){		alert("바퀴수" + msg); 			this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        				else if( wheelLimitQty == "" ){	alert("장착가능 바퀴수" + msg); 	this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        				else if( classCd == "" ){		alert("차량분류" + msg); 			this.ds_rtsd0004.set_rowposition(i); goSaveFlag = false; break; return false; }
        			}
        			
        			if( goSaveFlag ){
        				if( confirm( "저장하시겠습니까?")){
        					var sSvcID        	= "saveRTSDCarStandardRegister";                    
        					var sController   	= "rtms/sd/saveRTSDCarStandardRegister.do";
        					var sInDatasets   	= "";
        					var sOutDatasets  	= "";
        					var sArgs 			= "";
        					sInDatasets			+= " input=ds_rtsd0004:U ";
        					var fn_callBack		= "fn_callBack";
        					Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        				}
        			}
        		}
        	}else{
        		alert("저장할 데이터가 없습니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var sSvcID        	= "sRtsd0004Select";                    
        	var sController   	= "rtms/sd/sRtsd0004Select.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0004=rtsd0004SearchMap";
        	var sArgs 			= this.FN_sArgs();
        	var fn_callBack		= "fn_callBack";
        	this.ds_rtsd0004.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_sArgs = function(){
        	var sArgs = "";
        	sArgs += Ex.util.setParam("modelCd" 		,nvl(this.div_search.cb_modelCdS.value));
        	sArgs += Ex.util.setParam("contentsCd" 		,nvl(this.div_search.cb_contentsCdS.value));
        	sArgs += Ex.util.setParam("frCd" 			,nvl(this.div_search.cb_frCdS.value));
        	sArgs += Ex.util.setParam("sectionWidth" 	,nvl(this.div_search.cb_sectionWidthS.value));
        	sArgs += Ex.util.setParam("aspectRatio" 	,nvl(this.div_search.cb_aspectRatioS.value));
        	sArgs += Ex.util.setParam("wheelInches" 	,nvl(this.div_search.cb_wheelInchesS.value));
        	sArgs += Ex.util.setParam("plyRating" 		,nvl(this.div_search.cb_plyRatingS.value));
        	sArgs += Ex.util.setParam("wheelQty" 		,"");
        	sArgs += Ex.util.setParam("wheelLimitQty" 	,"");
        	sArgs += Ex.util.setParam("classCd" 		,"");
        	sArgs += Ex.util.setParam("useYn" 			,nvl(this.div_search.cb_useYnS.value));
        	sArgs += Ex.util.setParam("regId" 			,"");
        	return sArgs;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_modelCdS_onitemchanged = function(obj,e){
        	var sSvcID        	= "sRtsd0004ContentsCdSelect";                    
        	var sController   	= "rtms/sd/sRtsd0004ContentsCdSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_contentsCdS=contentsCdSearchMap";
        	var sArgs 			= this.FN_sArgs();
        	var fn_callBack		= "fn_callBack";
        	this.ds_contentsCdS.clearData();
        	this.ds_frCdS.clearData();
        	this.ds_plyRatingS.clearData();
        	this.ds_sectionWidthS.clearData();
        	this.ds_aspectRatioS.clearData();
        	this.ds_wheelInchesS.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_contentsCdS_onitemchanged = function(obj,e){
        	var sSvcID        	= "sRtsd0004FrCdSelect";                    
        	var sController   	= "rtms/sd/sRtsd0004FrCdSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_frCdS=fdCdSearchMap";
        	var sArgs 			= this.FN_sArgs();
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_frCdS.clearData();
        	this.ds_plyRatingS.clearData();
        	this.ds_sectionWidthS.clearData();
        	this.ds_aspectRatioS.clearData();
        	this.ds_wheelInchesS.clearData();

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_frCdS_onitemchanged = function(obj,e){
        	var sSvcID        	= "sRtsd0004PlyRatingCdSelect";                    
        	var sController   	= "rtms/sd/sRtsd0004PlyRatingCdSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_plyRatingS=plyRatingCdSearchMap";
        	var sArgs 			= this.FN_sArgs();
        	var fn_callBack		= "fn_callBack";
        	this.ds_plyRatingS.clearData();
        	this.ds_sectionWidthS.clearData();
        	this.ds_aspectRatioS.clearData();
        	this.ds_wheelInchesS.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_plyRatingS_onitemchanged = function(obj,e){
        	var sSvcID        	= "sRtsd0004SectionWidthSelect";                    
        	var sController   	= "rtms/sd/sRtsd0004SectionWidthSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_sectionWidthS=sectionWidthSearchMap";
        	var sArgs 			= this.FN_sArgs();
        	var fn_callBack		= "fn_callBack";
        	this.ds_sectionWidthS.clearData();
        	this.ds_aspectRatioS.clearData();
        	this.ds_wheelInchesS.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_sectionWidthS_onitemchanged = function(obj,e){
        	var sSvcID        	= "sRtsd0004AspectRatioSelect";                    
        	var sController   	= "rtms/sd/sRtsd0004AspectRatioSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_aspectRatioS=aspectRatioSearchMap";
        	var sArgs 			= this.FN_sArgs();
        	var fn_callBack		= "fn_callBack";
        	this.ds_aspectRatioS.clearData();
        	this.ds_wheelInchesS.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_aspectRatioS_onitemchanged = function(obj,e){
        	var sSvcID        	= "sRtsd0004WheelInchesSelect";                    
        	var sController   	= "rtms/sd/sRtsd0004WheelInchesSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_wheelInchesS=wheelInchesSearchMap";
        	var sArgs 			= this.FN_sArgs();
        	var fn_callBack		= "fn_callBack";
        	this.ds_wheelInchesS.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_new_onclick = function(obj,e){
        	var addRow = this.ds_rtsd0004.addRow();
        	this.ds_rtsd0004.setColumn(addRow, "useYn", "Y");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_del_onclick = function(obj,e){
        	var rowposition = this.ds_rtsd0004.rowposition;
        	if( this.ds_rtsd0004.getRowType( rowposition ) == 2 ){
        		this.ds_rtsd0004.deleteRow(rowposition);
        	}else{
        		alert("기존데이터는 삭제할 수 없습니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_carMasterSelect_onselectchanged = function(obj,e){
        	var rowposition = this.ds_rtsd0004.rowposition;
        	if( this.ds_rtsd0004.getRowType(rowposition) !=  2 ){
        		this.FN_enableFalse();
        	}else{
        		this.FN_enableTrue();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_enableTrue = function(){
        	this.cb_modelCd.set_enable(true);
        	this.cb_contentsCd.set_enable(true);
        	this.cb_frCd.set_enable(true);
        	this.cb_plyRating.set_enable(true);
        	this.cb_sectionWidth.set_enable(true);
        	this.cb_aspectRatio.set_enable(true);
        	this.cb_wheelInches.set_enable(true);
        	this.cb_wheelQty.set_enable(true);
        	this.cb_wheelLimitQty.set_enable(true);
        	this.cb_classCd.set_enable(true);
        	this.cb_useYn.set_enable(true);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_enableFalse = function(){
        	this.cb_modelCd.set_enable(false);
        	this.cb_contentsCd.set_enable(false);
        	this.cb_frCd.set_enable(false);
        	this.cb_plyRating.set_enable(false);
        	this.cb_sectionWidth.set_enable(false);
        	this.cb_aspectRatio.set_enable(false);
        	this.cb_wheelInches.set_enable(false);
        	//this.cb_wheelQty.set_enable(false);
        	//this.cb_wheelLimitQty.set_enable(false);
        	//this.cb_classCd.set_enable(false);
        	//this.cb_useYn.set_enable(false);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function(){
        	Ex.core.exportExcel(this, this.grid_carMasterSelect);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDCarStandardRegister_onload, this);
            this.grid_carMasterSelect.addEventHandler("onselectchanged", this.grid_carMasterSelect_onselectchanged, this);
            this.div_search.cb_modelCdS.addEventHandler("onitemchanged", this.div_search_cb_modelCdS_onitemchanged, this);
            this.div_search.cb_contentsCdS.addEventHandler("onitemchanged", this.div_search_cb_contentsCdS_onitemchanged, this);
            this.div_search.cb_frCdS.addEventHandler("onitemchanged", this.div_search_cb_frCdS_onitemchanged, this);
            this.div_search.cb_plyRatingS.addEventHandler("onitemchanged", this.div_search_cb_plyRatingS_onitemchanged, this);
            this.div_search.cb_sectionWidthS.addEventHandler("onitemchanged", this.div_search_cb_sectionWidthS_onitemchanged, this);
            this.div_search.cb_aspectRatioS.addEventHandler("onitemchanged", this.div_search_cb_aspectRatioS_onitemchanged, this);
            this.cb_modelCd.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_modelCd.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_contentsCd.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_contentsCd.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_frCd.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_frCd.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_sectionWidth.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_sectionWidth.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_aspectRatio.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_aspectRatio.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_wheelInches.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_wheelInches.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_plyRating.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_plyRating.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_wheelQty.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_wheelQty.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_wheelLimitQty.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_wheelLimitQty.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_classCd.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_classCd.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_useYn.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_useYn.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.btn_del.addEventHandler("onclick", this.div_search_btn_del_onclick, this);
            this.btn_new.addEventHandler("onclick", this.div_search_btn_new_onclick, this);

        };

        this.loadIncludeScript("RTSDCarStandardRegister.xfdl");

       
    };
}
)();
