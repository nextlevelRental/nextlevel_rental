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
                this.set_name("RTCOMMStrgRegister");
                this.set_classname("RTCSKeepRegister");
                this.set_titletext("보관등록");
                this._setFormPosition(0,0,975,536);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_ordNoList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtcs0203", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"strgSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"srrgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgYn\" type=\"STRING\" size=\"256\"/><Column id=\"strgStat\" type=\"STRING\" size=\"256\"/><Column id=\"srsvYn\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"strgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgDt\" type=\"STRING\" size=\"256\"/><Column id=\"strgMthd\" type=\"STRING\" size=\"256\"/><Column id=\"strgFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"strgFileName\" type=\"STRING\" size=\"256\"/><Column id=\"strgUserId\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDt\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFileName\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrUserId\" type=\"STRING\" size=\"256\"/><Column id=\"mfCd\" type=\"STRING\" size=\"256\"/><Column id=\"patternCd\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"tireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdF\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdF\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthF\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioF\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesF\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingF\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntF\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdR\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdR\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthR\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioR\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesR\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingR\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntR\" type=\"STRING\" size=\"256\"/><Column id=\"totTireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_UseAgencyWareh", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehNm\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_UseAgencyWarehCB", this);
            obj.set_firefirstcount("0");
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
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_keepHistory_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"mfCd\" type=\"STRING\" size=\"256\"/><Column id=\"patternCd\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"tireCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_keepHistory_2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdF\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdF\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthF\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioF\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesF\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingF\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntF\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdR\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdR\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthR\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioR\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesR\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingR\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntR\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mfCd_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_selectionWidth_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_aspectRatio_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelInches_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_plyRating_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tireCnt_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mfCd_2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_selectionWidth_2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_aspectRatio_2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelInches_2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_plyRating_2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tireCnt_2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mfCd_3", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_selectionWidth_3", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_aspectRatio_3", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wheelInches_3", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_plyRating_3", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tireCnt_3", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "15", "10", "169", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_text("계약자정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0203_1", "absolute", "15", "247", "945", "63", null, null, this);
            obj.set_taborder("16");
            obj.set_binddataset("ds_keepHistory_1");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_enable("true");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"25\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"구분\"/><Cell col=\"2\" text=\"제조사\"/><Cell col=\"3\" text=\"패턴\"/><Cell col=\"4\" text=\"폭\"/><Cell col=\"5\" text=\"시리즈\"/><Cell col=\"6\" text=\"인치\"/><Cell col=\"7\" text=\"PR\"/><Cell col=\"8\" text=\"수량\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"none\" text=\"bind:check\"/><Cell col=\"1\" text=\"앞/뒷바퀴\"/><Cell col=\"2\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:mfCd\" combodataset=\"ds_mfCd_1\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"3\" displaytype=\"text\" edittype=\"text\" text=\"bind:patternCd\" editdisplay=\"display\" combodisplay=\"edit\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:selectionWidth\" combodataset=\"ds_selectionWidth_1\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"5\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:aspectRatio\" combodataset=\"ds_aspectRatio_1\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"6\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:wheelInches\" combodataset=\"ds_wheelInches_1\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"7\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:plyRating\" combodataset=\"ds_plyRating_1\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"8\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:tireCnt\" combodataset=\"ds_tireCnt_1\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "30", "975", "10", null, null, this);
            obj.set_taborder("22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "15", "40", "945", "30", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "15", "40", "110", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_carKind", "absolute", "381", "40", "110", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_telNo", "absolute", "670", "40", "110", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("자택전화");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "15", "69", "945", "30", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cust", "absolute", "15", "69", "110", "30", null, null, this);
            obj.set_taborder("28");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_carNo", "absolute", "381", "69", "110", "30", null, null, this);
            obj.set_taborder("29");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_mobNo", "absolute", "670", "69", "110", "30", null, null, this);
            obj.set_taborder("30");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "101", "975", "20", null, null, this);
            obj.set_taborder("31");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "15", "117", "169", "20", null, null, this);
            obj.set_taborder("32");
            obj.set_text("보관서비스 제공자 정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "132", "975", "10", null, null, this);
            obj.set_taborder("33");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "15", "142", "945", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_buslNo01", "absolute", "15", "142", "110", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("렌탈전문점");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm01", "absolute", "381", "142", "110", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_telNo2", "absolute", "495", "147", "170", "20", null, null, this);
            obj.set_taborder("12");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_genderNm01", "absolute", "670", "142", "110", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_text("서비스적용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "15", "172", "945", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_buslNo02", "absolute", "15", "172", "110", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_text("보관지명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm02", "absolute", "381", "172", "110", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr", "absolute", "495", "177", "459", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "203", "975", "20", null, null, this);
            obj.set_taborder("41");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "15", "222", "300", "20", null, null, this);
            obj.set_taborder("42");
            obj.set_text("보관내역 (앞/뒤 바퀴가 같은 경우)");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "15", "237", "945", "10", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "0", "310", "975", "20", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "15", "326", "300", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("보관내역 (앞/뒤 바퀴가 다른 경우)");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "15", "341", "945", "10", null, null, this);
            obj.set_taborder("46");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0203_2", "absolute", "15", "351", "945", "93", null, null, this);
            obj.set_taborder("17");
            obj.set_binddataset("ds_keepHistory_2");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"25\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\"/><Cell col=\"1\" text=\"구분\"/><Cell col=\"2\" text=\"제조사\"/><Cell col=\"3\" text=\"패턴\"/><Cell col=\"4\" text=\"폭\"/><Cell col=\"5\" text=\"시리즈\"/><Cell col=\"6\" text=\"인치\"/><Cell col=\"7\" text=\"PR\"/><Cell col=\"8\" text=\"수량\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"none\" text=\"bind:check\"/><Cell col=\"1\" text=\"앞바퀴\"/><Cell col=\"2\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:mfCdF\" combodataset=\"ds_mfCd_2\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"3\" displaytype=\"text\" edittype=\"text\" text=\"bind:patternCdF\" editdisplay=\"display\" combodisplay=\"edit\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:selectionWidthF\" combodataset=\"ds_selectionWidth_2\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"5\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:aspectRatioF\" combodataset=\"ds_aspectRatio_2\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"6\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:wheelInchesF\" combodataset=\"ds_wheelInches_2\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"7\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:plyRatingF\" combodataset=\"ds_plyRating_2\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell col=\"8\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:tireCntF\" combodataset=\"ds_tireCnt_2\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell row=\"1\" displaytype=\"checkbox\" edittype=\"none\" text=\"bind:check\"/><Cell row=\"1\" col=\"1\" text=\"뒷바퀴\"/><Cell row=\"1\" col=\"2\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:mfCdR\" combodataset=\"ds_mfCd_3\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell row=\"1\" col=\"3\" displaytype=\"text\" edittype=\"text\" text=\"bind:patternCdR\" editdisplay=\"display\" combodisplay=\"edit\"/><Cell row=\"1\" col=\"4\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:selectionWidthR\" combodataset=\"ds_selectionWidth_3\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell row=\"1\" col=\"5\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:aspectRatioR\" combodataset=\"ds_aspectRatio_3\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell row=\"1\" col=\"6\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:wheelInchesR\" combodataset=\"ds_wheelInches_3\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell row=\"1\" col=\"7\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:plyRatingR\" combodataset=\"ds_plyRating_3\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/><Cell row=\"1\" col=\"8\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:tireCntR\" combodataset=\"ds_tireCnt_3\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"선택\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "15", "454", "945", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_buslNo03", "absolute", "15", "454", "150", "31", null, null, this);
            obj.set_taborder("48");
            obj.set_text("보관일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "129", "44", "247", "21", null, null, this);
            obj.set_taborder("0");
            obj.set_enable("true");
            obj.set_readonly("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_ordNo", "absolute", "355", "43", "21", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "129", "74", "125", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "254", "74", "122", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "495", "74", "170", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carKind", "absolute", "495", "45", "170", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_telNo", "absolute", "784", "45", "170", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNo", "absolute", "784", "74", "170", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyCd", "absolute", "129", "147", "110", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Button("bt_agencyCd", "absolute", "237", "146", "21", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyNm", "absolute", "257", "147", "119", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_wareh", "absolute", "129", "177", "247", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("14");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_UseAgencyWarehCB");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("선택");

            obj = new Calendar("cal_strgDay", "absolute", "170", "459", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("18");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static00", "absolute", "0", "0", "15", "530", null, null, this);
            obj.set_taborder("49");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "960", "0", "15", "530", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "0", "975", "10", null, null, this);
            obj.set_taborder("51");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "0", "485", "975", "10", null, null, this);
            obj.set_taborder("52");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", "870", "495", "41", "21", null, null, this);
            obj.set_taborder("20");
            obj.set_text("저장");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "919", "495", "41", "21", null, null, this);
            obj.set_taborder("21");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "516", "975", "20", null, null, this);
            obj.set_taborder("53");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "910", "484", "10", "52", null, null, this);
            obj.set_taborder("54");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_srsvYn", "absolute", "784", "147", "170", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_readonly("false");

            obj = new Static("Static23", "absolute", "0", "444", "975", "10", null, null, this);
            obj.set_taborder("55");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_buslNo04", "absolute", "487", "454", "150", "31", null, null, this);
            obj.set_taborder("56");
            obj.set_text("보관증 수령 방법");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_strgMthd", "absolute", "641", "459", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("19");
            obj.set_autoselect("true");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_strgMthd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 975, 536, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSKeepRegister");
            		p.set_titletext("보관등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_ordNo","value","ds_rtcs0203","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_agencyCd","value","ds_rtcs0203","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","cb_wareh","value","ds_rtcs0203","warehCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cb_srsvYn","value","ds_rtcs0203","srsvYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","cal_strgDay","value","ds_rtcs0203","strgDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","cb_strgMthd","value","ds_rtcs0203","strgMthd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_custNo","value","ds_rtcs0203","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_carKind","value","ds_ordNoList","carKind");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_telNo","value","ds_ordNoList","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_custNm","value","ds_ordNoList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_carNo","value","ds_ordNoList","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","ed_mobNo","value","ds_ordNoList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMStrgRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMStrgRegister.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 	 = "RTCOMMStrgRegister";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 	 = ""; 				//현재날짜
        this.grid_1_AddFlag = false;	//보관내역(앞/뒤 바퀴가 같은 경우) 체크해제시 false
        this.grid_2_AddFlag = false;	//보관내역(앞/뒤 바퀴가 다른 경우) 체크해제시 false
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTCOMMStrgRegister" ){
        		var useYnCt = this.ds_useYn.getRowCount();
        		if( useYnCt > 0 ){
        			this.cb_srsvYn.set_value( "Y" );
        		}
        		/*
        		var mfCd_1Cnt 				= this.ds_mfCd_1.getRowCount();
        		var selectionWidth_1Cnt 	= this.ds_selectionWidth_1.getRowCount();
        		var aspectRatio_1_Cnt 		= this.ds_aspectRatio_1.getRowCount();
        		var wheelInches_1_Cnt 		= this.ds_wheelInches_1.getRowCount();
        		var plyRating_1_Cnt 		= this.ds_plyRating_1.getRowCount();
        		var tireCnt_1_Cnt 			= this.ds_tireCnt_1.getRowCount();
        		var mfCd_2_Cnt 				= this.ds_mfCd_2.getRowCount();
        		var selectionWidth_2_Cnt 	= this.ds_selectionWidth_2.getRowCount();
        		var aspectRatio_2_Cnt 		= this.ds_aspectRatio_2.getRowCount();
        		var wheelInches_2_Cnt 		= this.ds_wheelInches_2.getRowCount();
        		var plyRating_2_Cnt 		= this.ds_plyRating_2.getRowCount();
        		var tireCnt_2_Cnt 			= this.ds_tireCnt_2.getRowCount();
        		var mfCd_3_Cnt 				= this.ds_mfCd_3.getRowCount();
        		var selectionWidth_3_Cnt 	= this.ds_selectionWidth_3.getRowCount();
        		var aspectRatio_3_Cnt 		= this.ds_aspectRatio_3.getRowCount();
        		var wheelInches_3_Cnt 		= this.ds_wheelInches_3.getRowCount();
        		var plyRating_3_Cnt 		= this.ds_plyRating_3.getRowCount();
        		var tireCnt_3_Cnt 			= this.ds_tireCnt_3.getRowCount();
        	
        		var mfCd_1Cnt 				= this.ds_strgStat.getRowCount();
        		var selectionWidth_1Cnt 	= this.ds_strgMthd.getRowCount();
        		var aspectRatio_1_Cnt 		= this.ds_strgStat.getRowCount();
        		var wheelInches_1_Cnt 		= this.ds_strgMthd.getRowCount();
        		var plyRating_1_Cnt 		= this.ds_strgStat.getRowCount();
        		var tireCnt_1_Cnt 			= this.ds_strgMthd.getRowCount();
        		var mfCd_2_Cnt 				= this.ds_strgStat.getRowCount();
        		var selectionWidth_2_Cnt 	= this.ds_strgMthd.getRowCount();
        		var aspectRatio_2_Cnt 		= this.ds_strgStat.getRowCount();
        		var wheelInches_2_Cnt		= this.ds_strgMthd.getRowCount();
        		var plyRating_2_Cnt 		= this.ds_strgStat.getRowCount();
        		var tireCnt_2_Cnt 			= this.ds_strgMthd.getRowCount();
        		var mfCd_3_Cnt 				= this.ds_strgStat.getRowCount();
        		var selectionWidth_3_Cnt 	= this.ds_strgMthd.getRowCount();
        		var aspectRatio_3_Cnt 		= this.ds_strgStat.getRowCount();
        		var wheelInches_3_Cnt 		= this.ds_strgMthd.getRowCount();
        		var plyRating_3_Cnt 		= this.ds_strgStat.getRowCount();
        		var tireCnt_3_Cnt 			= this.ds_strgMthd.getRowCount();
        		*/
        		
        		var insert1 = this.ds_mfCd_1.insertRow( 0 );
        		this.ds_mfCd_1.setColumn(insert1,"cd"," ");
        		this.ds_mfCd_1.setColumn(insert1,"cdNm","선택");

        		var insert2 = this.ds_selectionWidth_1.insertRow( 0 );
        		this.ds_selectionWidth_1.setColumn(insert2,"cd"," ");
        		this.ds_selectionWidth_1.setColumn(insert2,"cdNm","선택");

        		var insert3 = this.ds_aspectRatio_1.insertRow( 0 );
        		this.ds_aspectRatio_1.setColumn(insert3,"cd"," ");
        		this.ds_aspectRatio_1.setColumn(insert3,"cdNm","선택");

        		var insert4 = this.ds_wheelInches_1.insertRow( 0 );
        		this.ds_wheelInches_1.setColumn(insert4,"cd"," ");
        		this.ds_wheelInches_1.setColumn(insert4,"cdNm","선택");

        		var insert5 = this.ds_plyRating_1.insertRow( 0 );
        		this.ds_plyRating_1.setColumn(insert5,"cd"," ");
        		this.ds_plyRating_1.setColumn(insert5,"cdNm","선택");

        		var insert6 = this.ds_tireCnt_1.insertRow( 0 );
        		this.ds_tireCnt_1.setColumn(insert6,"cd"," ");
        		this.ds_tireCnt_1.setColumn(insert6,"cdNm","선택");

        		var insert7 = this.ds_mfCd_2.insertRow( 0 );
        		this.ds_mfCd_2.setColumn(insert7,"cd"," ");
        		this.ds_mfCd_2.setColumn(insert7,"cdNm","선택");

        		var insert8 = this.ds_selectionWidth_2.insertRow( 0 );
        		this.ds_selectionWidth_2.setColumn(insert8,"cd"," ");
        		this.ds_selectionWidth_2.setColumn(insert8,"cdNm","선택");

        		var insert9 = this.ds_aspectRatio_2.insertRow( 0 );
        		this.ds_aspectRatio_2.setColumn(insert9,"cd"," ");
        		this.ds_aspectRatio_2.setColumn(insert9,"cdNm","선택");

        		var insert10 = this.ds_wheelInches_2.insertRow( 0 );
        		this.ds_wheelInches_2.setColumn(insert10,"cd"," ");
        		this.ds_wheelInches_2.setColumn(insert10,"cdNm","선택");

        		var insert11 = this.ds_plyRating_2.insertRow( 0 );
        		this.ds_plyRating_2.setColumn(insert11,"cd"," ");
        		this.ds_plyRating_2.setColumn(insert11,"cdNm","선택");

        		var insert12 = this.ds_tireCnt_2.insertRow( 0 );
        		this.ds_tireCnt_2.setColumn(insert12,"cd"," ");
        		this.ds_tireCnt_2.setColumn(insert12,"cdNm","선택");

        		var insert13 = this.ds_mfCd_3.insertRow( 0 );
        		this.ds_mfCd_3.setColumn(insert13,"cd"," ");
        		this.ds_mfCd_3.setColumn(insert13,"cdNm","선택");

        		var insert14 = this.ds_selectionWidth_3.insertRow( 0 );
        		this.ds_selectionWidth_3.setColumn(insert14,"cd"," ");
        		this.ds_selectionWidth_3.setColumn(insert14,"cdNm","선택");

        		var insert15 = this.ds_aspectRatio_3.insertRow( 0 );
        		this.ds_aspectRatio_3.setColumn(insert15,"cd"," ");
        		this.ds_aspectRatio_3.setColumn(insert15,"cdNm","선택");

        		var insert16 = this.ds_wheelInches_3.insertRow( 0 );
        		this.ds_wheelInches_3.setColumn(insert16,"cd"," ");
        		this.ds_wheelInches_3.setColumn(insert16,"cdNm","선택");

        		var insert17 = this.ds_plyRating_3.insertRow( 0 );
        		this.ds_plyRating_3.setColumn(insert17,"cd"," ");
        		this.ds_plyRating_3.setColumn(insert17,"cdNm","선택");

        
        		var insert = this.ds_tireCnt_3.insertRow( 0 );
        		this.ds_tireCnt_3.setColumn(insert,"cd"," ");
        		this.ds_tireCnt_3.setColumn(insert,"cdNm","선택");
        		
        		
        		this.FN_gridRtcs0203_1_None();
        		this.FN_gridRtcs0203_2_None();
        	}
        	
        	if( strSvcId == "getToday" ){
        		if( nvl(this.toDay) != "" ){
        			this.cal_strgDay.set_value(this.toDay);
        		}
        	}
        	
        	if( strSvcId == "pSRtcs0202UseAgencyWareh" ){
        		var cnt = this.ds_UseAgencyWareh.getRowCount();
        		if( cnt != 0 ){
        			for( var i = 0 ; i < cnt ; i++ ){
        				this.ds_UseAgencyWarehCB.insertRow( i );
        				this.ds_UseAgencyWarehCB.setColumn(i, "cd",   this.ds_UseAgencyWareh.getColumn(i, "warehCd"));
        				this.ds_UseAgencyWarehCB.setColumn(i, "cdNm", this.ds_UseAgencyWareh.getColumn(i, "warehNm"));
        			}
        			if( cnt == 1){
        				this.cb_wareh.set_index(0);
        				this.cb_wareh.set_enable(false);
        				this.cb_wareh_onitemchanged();
        			}else{
        				this.cb_wareh.set_index(-1);
        				this.cb_wareh.set_enable(true);
        				this.cb_wareh_onitemchanged();
        			}
        		}
        	}
        	
        	if( strSvcId == "saveRtcs0203WinterIn" ){
        		alert(strErrorMsg);
        		if( nErrorCode == "0" ){
        			var pos = this.ds_rtcs0203.rowposition;
        			var ordNo 		= nvl(this.ds_rtcs0203.getColumn(pos, "ordNo"));
        			var agencyCd 	= nvl(this.ds_rtcs0203.getColumn(pos, "agencyCd"));
        			var agencyNm	= nvl(this.ed_agencyNm.value);
        			var strgDay 	= nvl(this.ds_rtcs0203.getColumn(pos, "strgDay"));
        			var custNo 		= nvl(this.ds_rtcs0203.getColumn(pos, "custNo"));
        			var custNm		= nvl(this.ed_custNm.value);
        			var warehCd 	= nvl(this.ds_rtcs0203.getColumn(pos, "warehCd"));
        			var warehNm		= nvl(this.cb_wareh.text);
        			var carNo		= nvl(this.ed_carNo.value);
        			var strgStat 	= nvl(this.ds_rtcs0203.getColumn(pos, "strgStat"));
        			var strgMthd 	= nvl(this.ds_rtcs0203.getColumn(pos, "strgMthd"));
        			this.close( this.opener.FNstrgSave(ordNo, agencyCd, agencyNm, strgDay, custNo, custNm, warehCd, warehNm, carNo, strgStat, strgMthd) );
        		}
        	}
        	
        	if( strSvcId == "ordNoList" ){
        		var cnt_1 = this.ds_ordNoList.getRowCount();
        		var pos_1 = this.ds_ordNoList.rowposition;
        		
        		var cnt_2 = this.ds_rtcs0203.getRowCount();
        		var pos_2 = this.ds_rtcs0203.rowposition;
        		
        		if( cnt_1 != 1 ){
        			alert("계약번호를 확인하세요");
        			this.ds_ordNoList.clearData();
        			this.ds_rtcs0203.setColumn( pos_2, "ordNo", "" );
        			this.ds_rtcs0203.setColumn( pos_2, "custNo", "" );
        			this.RTCOMMStrgRegister_onload();
        		}else{
        			if( (cnt_2 == 1) ){
        				var seasonCd = nvl(this.ds_ordNoList.getColumn(pos_1,"seasonCd"));
        				var statCd 	 = nvl(this.ds_ordNoList.getColumn(pos_1,"statCd"));
        				
        				if( (statCd != "03") && (statCd != "04") ){
        					alert("보관등록을 할 수 없는 계약상태입니다.");
        					this.ed_ordNo.set_value("");
        					this.ed_custNo.set_value("");
        					this.ds_ordNoList.clearData();
        				}else if( seasonCd != "02" ){
        					alert("계절 구분 겨울용이 아니므로 보관 등록을 할 수가 없습니다.");
        					this.ed_ordNo.set_value("");
        					this.ed_custNo.set_value("");
        					this.ds_ordNoList.clearData();
        				}else{
        					this.ds_rtcs0203.setColumn( pos_2,  "ordNo",  this.ds_ordNoList.getColumn(pos_1,"ordNo") );
        					this.ds_rtcs0203.setColumn( pos_2,  "custNo", this.ds_ordNoList.getColumn(pos_1,"custNo") );
        					this.ds_ordNoList.setColumn( pos_2, "telNo",  FN_numberHyphenInReturn(this.ds_ordNoList.getColumn(pos_1,"telNo")) );
        					this.ds_ordNoList.setColumn( pos_2, "mobNo",  FN_numberHyphenInReturn(this.ds_ordNoList.getColumn(pos_1,"mobNo")) );
        				}
        			}else{
        				alert("SYSTEM ERROR : 보관등록 DATA SET");
        			}
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMStrgRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        }
        this.fn_init = function(){
        	this.ds_rtcs0203.clearData();
        	this.ds_rtcs0203.addRow();
        	
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	
        	var sSvcID      	= "initRTCOMMStrgRegister";  
        	var sController   	= "rtms/cs/initRTCOMMStrgRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_useYn=mapDsUseYn ";
        	sOutDatasets += " ds_strgMthd=mapDsStrgMthd ";
        	sOutDatasets += " ds_mfCd_1=mapDsMfCd_1 "						//타이어제조사
        	sOutDatasets += " ds_selectionWidth_1=mapDsSelectionWidth_1 "	//폭
        	sOutDatasets += " ds_aspectRatio_1=mapDsAspectRatio_1 "			//시리즈
        	sOutDatasets += " ds_wheelInches_1=mapDsWheelInches_1 "			//인치
        	sOutDatasets += " ds_plyRating_1=mapDsPlyRating_1 "				//강도
        	sOutDatasets += " ds_tireCnt_1=mapDsTireCnt_1 "					//수량
        	sOutDatasets += " ds_mfCd_2=mapDsMfCd_2 "						//타이어제조사
        	sOutDatasets += " ds_selectionWidth_2=mapDsSelectionWidth_2 "	//폭
        	sOutDatasets += " ds_aspectRatio_2=mapDsAspectRatio_2 "			//시리즈
        	sOutDatasets += " ds_wheelInches_2=mapDsWheelInches_2 "			//인치
        	sOutDatasets += " ds_plyRating_2=mapDsPlyRating_2 "				//강도
        	sOutDatasets += " ds_tireCnt_2=mapDsTireCnt_2 "					//수량
        	sOutDatasets += " ds_mfCd_3=mapDsMfCd_3 "						//타이어제조사
        	sOutDatasets += " ds_selectionWidth_3=mapDsSelectionWidth_3 "	//폭
        	sOutDatasets += " ds_aspectRatio_3=mapDsAspectRatio_3 "			//시리즈
        	sOutDatasets += " ds_wheelInches_3=mapDsWheelInches_3 "			//인치
        	sOutDatasets += " ds_plyRating_3=mapDsPlyRating_3 "				//강도
        	sOutDatasets += " ds_tireCnt_3=mapDsTireCnt_3 "					//수량
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_ordNo_onclick = function(obj,e){
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }
        this.returnOrderNo = function(arr){
        	this.ds_ordNoList.clearData();
        	var nRow = this.ds_ordNoList.addRow();
        	this.ds_ordNoList.setColumn( nRow, "ordNo", arr[0] );
        	
        	this.ed_ordNo.set_value(arr[0]);
        	this.ed_carKind.set_value(arr[1]);
        	if(nvl(arr[2]) != ""){
        		this.ed_telNo.set_value( FN_numberHyphenInReturn(arr[2]) );
        	}
        	this.ed_custNo.set_value(arr[3]);
        	this.ed_custNm.set_value(arr[4]);
        	this.ed_carNo.set_value(arr[5]);
        	if(nvl(arr[6]) != ""){
        		this.ed_mobNo.set_value( FN_numberHyphenInReturn(arr[6]) );
        	}
        	
        	var seasonCd = nvl(arr[7]);
        	if( seasonCd != "02" ){
        		alert("계절 구분 겨울용이 아니므로 보관 등록을 할 수가 없습니다.");
        		this.ed_ordNo.set_value("");
        		this.ed_custNo.set_value("");
        		this.ds_ordNoList.clearData();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_agencyCd_onclick = function(obj,e){
        	var args = {p_arg : this.p_arg};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this.returnAgencyCd = function(res) {
        	this.ed_agencyCd.set_value( res[0] );
        	this.ed_agencyNm.set_value( res[1] );
        	this.ed_telNo2.set_value( FN_numberHyphenInReturn(res[2]) );
        	this.FN_selectWarehStrgReg( res[0] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_selectWarehStrgReg = function(agencyCd ){
        	if( nvl(agencyCd) != ""){
        		var sSvcID      	= "pSRtcs0202UseAgencyWareh";  
        		var sController   	= "/rtms/cs/pSRtcs0202UseAgencyWareh.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= " ds_UseAgencyWareh=mapUseAgencyWareh";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("agencyCd", agencyCd);
        		this.ds_UseAgencyWareh.clearData();
        		this.ds_UseAgencyWarehCB.clearData();
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cb_wareh_onitemchanged = function(obj,e){
        	var cd   = this.cb_wareh.value;
        	var cdNm = this.cb_wareh.text;
        	var nRow  = this.ds_UseAgencyWareh.findRowExpr("warehCd == '"+cd+"' && warehNm == '"+cdNm+"'");
        	var addr  = nvl(this.ds_UseAgencyWareh.getColumn( nRow, "addr"));
        	this.ed_addr.set_value( addr );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_rtcs0203_1_onheadclick = function(obj,e){
        	if( e.cell == this.grid_rtcs0203_1.getBindCellIndex( "body", "check") ){
        		if( this.ds_keepHistory_1.getColumn(0,"check") == 0){
        			this.FN_gridRtcs0203_1_Combo();
        		}else{
        			this.FN_gridRtcs0203_1_None();
        		}
        	}
        }
        this.FN_gridRtcs0203_1_Combo = function(){
        	this.grid_rtcs0203_1.setCellProperty("Body",2,"edittype","combo");
        	this.grid_rtcs0203_1.setCellProperty("Body",3,"edittype","text");
        	this.grid_rtcs0203_1.setCellProperty("Body",4,"edittype","combo");
        	this.grid_rtcs0203_1.setCellProperty("Body",5,"edittype","combo");
        	this.grid_rtcs0203_1.setCellProperty("Body",6,"edittype","combo");
        	this.grid_rtcs0203_1.setCellProperty("Body",7,"edittype","combo");
        	this.grid_rtcs0203_1.setCellProperty("Body",8,"edittype","combo");
        	
        	this.grid_rtcs0203_1.setCellProperty("Body",2,"combodisplaynulltext","선택");
        	this.grid_rtcs0203_1.setCellProperty("Body",3,"combodisplaynulltext","선택");
        	this.grid_rtcs0203_1.setCellProperty("Body",4,"combodisplaynulltext","선택");
        	this.grid_rtcs0203_1.setCellProperty("Body",5,"combodisplaynulltext","선택");
        	this.grid_rtcs0203_1.setCellProperty("Body",6,"combodisplaynulltext","선택");
        	this.grid_rtcs0203_1.setCellProperty("Body",7,"combodisplaynulltext","선택");
        	this.grid_rtcs0203_1.setCellProperty("Body",8,"combodisplaynulltext","선택");
        	
        	this.grid_1_AddFlag = true;
        }
        this.FN_gridRtcs0203_1_None = function(inx){
        	this.ds_keepHistory_1.clearData();
        	var nRow_1 = this.ds_keepHistory_1.addRow();
        	this.ds_keepHistory_1.setColumn(nRow_1,"check","0");
        	
        	this.grid_rtcs0203_1.setCellProperty("Body",2,"edittype","none");
        	this.grid_rtcs0203_1.setCellProperty("Body",3,"edittype","none");
        	this.grid_rtcs0203_1.setCellProperty("Body",4,"edittype","none");
        	this.grid_rtcs0203_1.setCellProperty("Body",5,"edittype","none");
        	this.grid_rtcs0203_1.setCellProperty("Body",6,"edittype","none");
        	this.grid_rtcs0203_1.setCellProperty("Body",7,"edittype","none");
        	this.grid_rtcs0203_1.setCellProperty("Body",8,"edittype","none");
        	
        	this.grid_rtcs0203_1.setCellProperty("Body",2,"combodisplaynulltext","-");
        	this.grid_rtcs0203_1.setCellProperty("Body",3,"combodisplaynulltext","-");
        	this.grid_rtcs0203_1.setCellProperty("Body",4,"combodisplaynulltext","-");
        	this.grid_rtcs0203_1.setCellProperty("Body",5,"combodisplaynulltext","-");
        	this.grid_rtcs0203_1.setCellProperty("Body",6,"combodisplaynulltext","-");
        	this.grid_rtcs0203_1.setCellProperty("Body",7,"combodisplaynulltext","-");
        	this.grid_rtcs0203_1.setCellProperty("Body",8,"combodisplaynulltext","-");
        	
        	this.grid_1_AddFlag = false;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_rtcs0203_2_onheadclick = function(obj,e){
        	if( e.cell == this.grid_rtcs0203_2.getBindCellIndex( "body", "check") ){
        		if( this.ds_keepHistory_2.getColumn(0,"check") == 0){
        			this.FN_gridRtcs0203_2_Combo();
        		}else{
        			this.FN_gridRtcs0203_2_None();
        		}
        	}
        }
        this.FN_gridRtcs0203_2_Combo = function(){
        	this.grid_rtcs0203_2.setCellProperty("Body", 2, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 3, "edittype", "text");
        	this.grid_rtcs0203_2.setCellProperty("Body", 4, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 5, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 6, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 7, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 8, "edittype", "combo");
        													
        	this.grid_rtcs0203_2.setCellProperty("Body", 11, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 12, "edittype", "text");
        	this.grid_rtcs0203_2.setCellProperty("Body", 13, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 14, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 15, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 16, "edittype", "combo");
        	this.grid_rtcs0203_2.setCellProperty("Body", 17, "edittype", "combo");
        													
        	this.grid_rtcs0203_2.setCellProperty("Body", 2, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 3, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 4, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 5, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 6, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 7, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 8, "combodisplaynulltext", "선택");
        													
        	this.grid_rtcs0203_2.setCellProperty("Body", 11, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 12, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 13, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 14, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 15, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 16, "combodisplaynulltext", "선택");
        	this.grid_rtcs0203_2.setCellProperty("Body", 17, "combodisplaynulltext", "선택");
        	
        	this.grid_2_AddFlag = true;
        }
        this.FN_gridRtcs0203_2_None = function(){
        	this.ds_keepHistory_2.clearData();
        	var nRow_2 = this.ds_keepHistory_2.addRow();
        	this.ds_keepHistory_2.setColumn(nRow_2,"check","0");
        	
        	this.grid_rtcs0203_2.setCellProperty("Body", 2, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 3, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 4, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 5, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 6, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 7, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 8, "edittype", "none");
        	
        	this.grid_rtcs0203_2.setCellProperty("Body", 11, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 12, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 13, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 14, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 15, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 16, "edittype", "none");
        	this.grid_rtcs0203_2.setCellProperty("Body", 17, "edittype", "none");
        	
        	this.grid_rtcs0203_2.setCellProperty("Body", 2, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 3, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 4, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 5, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 6, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 7, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 8, "combodisplaynulltext", "-");
        	
        	this.grid_rtcs0203_2.setCellProperty("Body", 11, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 12, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 13, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 14, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 15, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 16, "combodisplaynulltext", "-");
        	this.grid_rtcs0203_2.setCellProperty("Body", 17, "combodisplaynulltext", "-");
        	
        	this.grid_2_AddFlag = false;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_save_onclick = function(obj,e){
        	var row  	  = this.ds_rtcs0203.rowposition;
        	var ordNoRow  = this.ds_ordNoList.rowposition;
        	
        	if( (row != -1) && (ordNoRow != -1) ){
        		if( this.ds_rtcs0203.getColumn( row, "ordNo" ) != this.ds_ordNoList.getColumn( ordNoRow, "ordNo" ) ){
        			alert("조회했던 계약번호가 다르므로 저장할 수 없습니다.");
        			return false;
        		}
        	}
        	
        	if( row != -1 ){
        		var ordNo 		= nvl(this.ds_rtcs0203.getColumn(row,"ordNo"));
        		var custNo 		= nvl(this.ds_rtcs0203.getColumn(row,"custNo"));
        		var srsvYn 		= nvl(this.ds_rtcs0203.getColumn(row,"srsvYn"));
        		var agencyCd 	= nvl(this.ds_rtcs0203.getColumn(row,"agencyCd"));
        		var warehCd 	= nvl(this.ds_rtcs0203.getColumn(row,"warehCd"));
        		var strgDay 	= nvl(this.ds_rtcs0203.getColumn(strgDay,"strgDay"));
        		var strgMthd 	= nvl(this.ds_rtcs0203.getColumn(strgMthd,"strgMthd"));
        		var msg			= " 값이 없습니다.";
        		
        		if( ordNo == "" ){ 		alert("계약번호" + msg); 			return false; }
        		if( custNo == "" ){ 	alert("고객번호" + msg); 			return false; }
        		if( srsvYn == "" ){ 	alert("서비스적용여부" + msg); 	return false; }
        		if( agencyCd == "" ){ 	alert("렌탈전문점" + msg); 		return false; }
        		if( warehCd == "" ){ 	alert("보관지명" + msg); 			return false; }
        		if( strgDay == "" ){ 	alert("보관일자" + msg); 			return false; }
        		if( strgMthd == "" ){ 	alert("보관증수령방법" + msg); 	return false; }
        		if( this.grid_1_AddFlag == true && this.grid_2_AddFlag == true){
        			alert("보관내역 (앞/뒤 바퀴가 같은경우) 또는 (앞/뒤 바퀴가 다른경우) 둘중에 하나만 입력 되어야합니다.");
        			return false;
        		}
        		if( this.grid_1_AddFlag == false && this.grid_2_AddFlag == false){
        			alert("보관내역 (앞/뒤 바퀴가 같은경우) 또는 (앞/뒤 바퀴가 다른경우) 둘중에 하나가 입력 되어야합니다.");
        			return false;
        		}
        		
        		var row_1			= this.ds_keepHistory_1.rowposition;
        		var mfCd 			= nvl(this.ds_keepHistory_1.getColumn( row_1, "mfCd"));
        		var patternCd 		= nvl(this.ds_keepHistory_1.getColumn( row_1, "patternCd"));
        		var selectionWidth 	= nvl(this.ds_keepHistory_1.getColumn( row_1, "selectionWidth"));
        		var aspectRatio 	= nvl(this.ds_keepHistory_1.getColumn( row_1, "aspectRatio"));
        		var wheelInches 	= nvl(this.ds_keepHistory_1.getColumn( row_1, "wheelInches"));
        		var plyRating 		= nvl(this.ds_keepHistory_1.getColumn( row_1, "plyRating"));
        		var tireCnt 		= nvl(this.ds_keepHistory_1.getColumn( row_1, "tireCnt"));
        		
        		var row_2			= this.ds_keepHistory_1.rowposition;
        		var mfCdF			= nvl(this.ds_keepHistory_2.getColumn( row_2, "mfCdF"));
        		var patternCdF		= nvl(this.ds_keepHistory_2.getColumn( row_2, "patternCdF"));
        		var selectionWidthF	= nvl(this.ds_keepHistory_2.getColumn( row_2, "selectionWidthF"));
        		var aspectRatioF	= nvl(this.ds_keepHistory_2.getColumn( row_2, "aspectRatioF"));
        		var wheelInchesF	= nvl(this.ds_keepHistory_2.getColumn( row_2, "wheelInchesF"));
        		var plyRatingF		= nvl(this.ds_keepHistory_2.getColumn( row_2, "plyRatingF"));
        		var tireCntF		= nvl(this.ds_keepHistory_2.getColumn( row_2, "tireCntF"));
        		var mfCdR			= nvl(this.ds_keepHistory_2.getColumn( row_2, "mfCdR"));
        		var patternCdR		= nvl(this.ds_keepHistory_2.getColumn( row_2, "patternCdR"));
        		var selectionWidthR	= nvl(this.ds_keepHistory_2.getColumn( row_2, "selectionWidthR"));
        		var aspectRatioR	= nvl(this.ds_keepHistory_2.getColumn( row_2, "aspectRatioR"));
        		var wheelInchesR	= nvl(this.ds_keepHistory_2.getColumn( row_2, "wheelInchesR"));
        		var plyRatingR		= nvl(this.ds_keepHistory_2.getColumn( row_2, "plyRatingR"));
        		var tireCntR		= nvl(this.ds_keepHistory_2.getColumn( row_2, "tireCntR"));

        		if( this.grid_1_AddFlag == true ){
        			if( mfCd == "" ){ 			alert("제조사" + msg); return false;}
        			if( patternCd == "" ){ 		alert("패턴" + msg); 	return false;}
        			if( selectionWidth == "" ){ alert("폭" + msg); 		return false;}
        			if( aspectRatio == "" ){ 	alert("시리즈" + msg); return false;}
        			if( wheelInches == "" ){ 	alert("인치" + msg); 	return false;}
        			if( plyRating == "" ){ 		alert("PR" + msg); 		return false;}
        			if( tireCnt == "" ){ 		alert("수량" + msg); 	return false;}
        		}
        		
        		if( this.grid_2_AddFlag == true ){
        			if( ((mfCdF == "") && (patternCdF == "") && (selectionWidthF == "") && (aspectRatioF == "") && (wheelInchesF == "") && (plyRatingF == "") && (tireCntF == "")) 
        				&&
        				((mfCdR == "") && (patternCdR == "") && (selectionWidthR == "") && (aspectRatioR == "") && (wheelInchesR == "") && (plyRatingR == "") && (tireCntR == ""))
        			){
        				alert("보관내역(앞/뒤 바퀴가 다른경우) 앞바퀴 또는 뒷바퀴 정보를 입력해야됩니다.");
        				return false;
        			}
        		
        			if( (mfCdF != "") || (patternCdF != "") || (selectionWidthF != "") || (aspectRatioF != "") || (wheelInchesF != "") || (plyRatingF != "") || (tireCntF != "") ){
        				if( mfCdF == "" ){ 			alert("(앞바퀴)제조사" + msg);	return false;}
        				if( patternCdF == "" ){ 	alert("(앞바퀴)패턴" + msg); 		return false;}
        				if( selectionWidthF == "" ){alert("(앞바퀴)폭" + msg); 		return false;}
        				if( aspectRatioF == "" ){ 	alert("(앞바퀴)시리즈" + msg);	return false;}
        				if( wheelInchesF == "" ){ 	alert("(앞바퀴)인치" + msg); 		return false;}
        				if( plyRatingF == "" ){ 	alert("(앞바퀴)PR" + msg); 		return false;}
        				if( tireCntF == "" ){ 		alert("(앞바퀴)수량" + msg); 		return false;}
        			}
        			
        			if( (mfCdR != "") || (patternCdR != "") || (selectionWidthR != "") || (aspectRatioR != "") || (wheelInchesR != "") || (plyRatingR != "") || (tireCntR != "") ){
        				if( mfCdR == "" ){ 			alert("(뒷바퀴)제조사" + msg);	return false;}
        				if( patternCdR == "" ){ 	alert("(뒷바퀴)패턴" + msg); 		return false;}
        				if( selectionWidthR == "" ){alert("(뒷바퀴)폭" + msg); 		return false;}
        				if( aspectRatioR == "" ){ 	alert("(뒷바퀴)시리즈" + msg);	return false;}
        				if( wheelInchesR == "" ){ 	alert("(뒷바퀴)인치" + msg); 		return false;}
        				if( plyRatingR == "" ){ 	alert("(뒷바퀴)PR" + msg); 		return false;}
        				if( tireCntR == "" ){ 		alert("(뒷바퀴)수량" + msg); 		return false;}
        			}
        		}
        		
        		if( this.grid_1_AddFlag == true ){
        			this.ds_rtcs0203.setColumn( row, "mfCd", 			mfCd );
        			this.ds_rtcs0203.setColumn( row, "patternCd", 		patternCd );
        			this.ds_rtcs0203.setColumn( row, "selectionWidth", 	selectionWidth );
        			this.ds_rtcs0203.setColumn( row, "aspectRatio", 	aspectRatio );
        			this.ds_rtcs0203.setColumn( row, "wheelInches", 	wheelInches );
        			this.ds_rtcs0203.setColumn( row, "plyRating", 		plyRating );
        			this.ds_rtcs0203.setColumn( row, "tireCnt", 		tireCnt );
        		}
        		
        		if( this.grid_2_AddFlag == true ){
        			this.ds_rtcs0203.setColumn( row, "mfCdF", 			mfCdF );
        			this.ds_rtcs0203.setColumn( row, "patternCdF", 		patternCdF );
        			this.ds_rtcs0203.setColumn( row, "selectionWidthF", selectionWidthF );
        			this.ds_rtcs0203.setColumn( row, "aspectRatioF", 	aspectRatioF );
        			this.ds_rtcs0203.setColumn( row, "wheelInchesF", 	wheelInchesF );
        			this.ds_rtcs0203.setColumn( row, "plyRatingF", 		plyRatingF );
        			this.ds_rtcs0203.setColumn( row, "tireCntF", 		tireCntF );
        			this.ds_rtcs0203.setColumn( row, "mfCdR", 			mfCdR );
        			this.ds_rtcs0203.setColumn( row, "patternCdR", 		patternCdR );
        			this.ds_rtcs0203.setColumn( row, "selectionWidthR", selectionWidthR );
        			this.ds_rtcs0203.setColumn( row, "aspectRatioR", 	aspectRatioR );
        			this.ds_rtcs0203.setColumn( row, "wheelInchesR", 	wheelInchesR );
        			this.ds_rtcs0203.setColumn( row, "plyRatingR", 		plyRatingR );
        			this.ds_rtcs0203.setColumn( row, "tireCntR", 		tireCntR );
        		}
        		
        		this.ds_rtcs0203.setColumn( row, "strgStat", "S" );//보관상태
        		this.ds_rtcs0203.setColumn( row, "strgYn", "Y" );  //보관여부
        		
        		var sSvcID        	= "saveRtcs0203WinterIn";                    
        		var sController   	= "rtms/cs/saveRtcs0203WinterIn.do";
        		var sInDatasets   	= " input=ds_rtcs0203:U ";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}else{
        		alert("보관 등록할 정보가 없습니다.");
        		return false;
        	}
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMStrgRegister_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cal_strgDay_onchanged = function(obj,e){
        	var thisValue =  obj.value;
        	var firstDate =  Eco.date.getFirstDate(this.toDay);
        	var lastDay   =  this.toDay.substr(0,4)+this.toDay.substr(4,2)+Eco.date.getLastDayOfMonth(this.toDay);
        	
        	if( !(( firstDate <= thisValue ) && (thisValue <= lastDay)) ){
        		alert("보관일자는 "+firstDate+" ~ "+lastDay+" 선택가능합니다.");
        		obj.set_value(this.toDay);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ed_ordNo_onkeyup = function(obj,e){
        	if(e.keycode == 13 ){
        		var ordNo = nvl(this.ed_ordNo.value);
        		if( ordNo != "" ){
        			var sSvcID        	= "ordNoList";                    
        			var sController   	= "rtms/comm/ordNoList.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_ordNoList=ordNoMap";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			this.ds_ordNoList.deleteAll();
        			sArgs += Ex.util.setParam("ordNo",ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onkeyup", this.RTCOMMStrgRegister_onkeyup, this);
            this.addEventHandler("onload", this.RTCOMMStrgRegister_onload, this);
            this.grid_rtcs0203_1.addEventHandler("onheadclick", this.grid_rtcs0203_1_onheadclick, this);
            this.grid_rtcs0203_2.addEventHandler("onheadclick", this.grid_rtcs0203_2_onheadclick, this);
            this.ed_ordNo.addEventHandler("onkeyup", this.ed_ordNo_onkeyup, this);
            this.bt_ordNo.addEventHandler("onclick", this.bt_ordNo_onclick, this);
            this.bt_agencyCd.addEventHandler("onclick", this.bt_agencyCd_onclick, this);
            this.cb_wareh.addEventHandler("onitemchanged", this.cb_wareh_onitemchanged, this);
            this.cal_strgDay.addEventHandler("onchanged", this.cal_strgDay_onchanged, this);
            this.btn_save.addEventHandler("onclick", this.btn_save_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMStrgRegister.xfdl");

       
    };
}
)();
